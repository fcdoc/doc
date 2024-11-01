import fs from 'node:fs/promises'

> js-yaml > load
  @3-/read
  fs > existsSync
  @3-/wget:_wget
  @3-/pool > Pool
  @3-/ext:_ext
  path > join dirname
  sharp
  @3-/retry

wget = retry wget

downImg = retry (url, ofp) =>
  await fs.mkdir dirname(ofp), recursive: true
  response = await fetch url, {redirect: 'follow'}
  buffer = new Uint8Array await response.arrayBuffer()
  await sharp(buffer)
    .avif({ quality: 90 })
    .toFile(ofp)
  return

ROOT = dirname(import.meta.dirname)
RE_MDIMG = /\ssrc="([^"]+)"|!\[([^\]]*?)\]\(([^)]+)\)/g

+ SRC_LANG, PREFIX

do =>
  {i18n} = load read join ROOT, '.i18n/conf.yml'

  keys = Object.keys(i18n.replace or {})

  if keys.length == 0
    return

  PREFIX = keys[0]

  for [k,v] from Object.entries i18n.fromTo
    if not v
      SRC_LANG = k
      return
    else if not SRC_LANG
      SRC_LANG = k
  return

OUT = join ROOT, 'img', SRC_LANG+'/'

PREFIX+=SRC_LANG+'/'

nextId = (id, rel, ext)=>
  loop
    rfp = rel+'/'+(++id)+'.'+ext
    fp = OUT + rfp
    if not existsSync fp
      return [id,rfp]
  return

EXIST = new Map

< (li, rpath)=>
  if not PREFIX
    return
  p = rpath.lastIndexOf('.')
  rel = rpath.slice(0,p)
  id = 0

  pool = Pool 10

  for line,pos in li
    li[pos] = line.replace(
    # line.replace(
      RE_MDIMG,
      (_, url1, title, url2)=>
        url = url1 or url2
        if url.startsWith(PREFIX)
          return _
        exist_url = EXIST.get url
        if exist_url
          return _.replace(url,exist_url)
        ext = _ext url
        is_img = ['jpg','png','jpeg'].includes ext
        [id, rfp] = nextId(id, rel, if is_img then 'avif' else ext)
        new_url = PREFIX+rfp
        console.log url, rfp
        EXIST.set url, new_url
        ofp  = OUT+rfp
        pool (if is_img then downImg else wget), url, ofp
        if url1
          return ' src="'+new_url+'"'
        if title.endsWith('.png')
          title = ''
        return '!['+title+']('+new_url+')'
    )
  await pool.done
  return
