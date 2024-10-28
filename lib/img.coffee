> js-yaml > load
  @3-/read
  fs > existsSync
  @3-/wget
  @3-/pool > Pool
  @3-/ext:_ext
  path > join dirname

ROOT = dirname(import.meta.dirname)
RE_MDIMG = /\ssrc="([^"]+)"|!\[[(^\])]*?\]\(([^)]+)\)/g

+ SRC_LANG, PREFIX

do =>
  {i18n} = load read join ROOT, '.i18n/conf.yml'

  PREFIX = i18n.url[0]

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
          return
        exist_url = EXIST.get url
        if exist_url
          return _.replace(url,exist_url)
        ext = _ext url
        if ['jpg','png','jpeg'].includes ext
          console.log 'todo'
        else
          [id, rfp] = nextId(id, rel, ext)
          new_url = PREFIX+rfp
          EXIST.set url, new_url
          console.log url, rfp
          pool wget, url, OUT+rfp
          if url1
            return ' src="'+new_url+'"'
          else
            return '!['+title+']('+new_url+')'
        return
    )
  await pool.done
  return
