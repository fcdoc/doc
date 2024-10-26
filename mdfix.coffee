#!/usr/bin/env coffee

> @3-/walk
  @3-/read
  @3-/write
  @3-/is-change:IsChange
  @3-/pool > Pool
  path > join
  ./lib/FIXER

ROOT = import.meta.dirname
MD =  join ROOT, 'zh'

[
  isChange
  saveChange
] = IsChange(
  join ROOT,'.fix'
  MD
)

dump = (path, changed) =>
  rpath = path.slice(MD.length+1)
  r = await isChange(rpath)
  if not r
    return

  md = read(path).trimEnd().replace('\r\n','\n')

  li = []
  for i from md.split('\n')
    i = i.trimEnd()
    li.push i

  for fix from FIXER
    r = await fix li, rpath
    if r
      li = r

  new_md = li.join('\n').replace(/\n{3,}/g, "\n\n")

  if new_md != md
    write path, new_md

  changed.push rpath
  return

do =>
  pool = Pool 10
  changed = []

  for await path from walk MD, (i)=>i.startsWith('.')
    if path.endsWith('.md')
      await pool dump, path, changed

  await pool.done

  if changed.length
    console.log 'changed',changed.length
    await saveChange changed

  process.exit 0
  return
