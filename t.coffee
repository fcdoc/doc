#!/usr/bin/env coffee

> @3-/read
  @3-/write

ROOT = import.meta.dirname

li = read('2.txt').trim().split('\n')

name2url = new Map

for i from li
  i = i.split('^')
  name2url.set i[1].split('#').pop().trim(), i[0].slice(11,-3).replaceAll('"','')

# console.log name2url

li = read('old.txt').trim().split('\n')
from_to = []
for i from li
  [path, h1, url] = i.split('^')
  h1 = h1.split('title:').pop().trim().replaceAll('"','')
  url = url.split('url:').pop().trim().replaceAll('"','').trim()
  u = name2url.get(h1)
  if u
    console.log h1, url, u
    from_to.push [url, name2url.get(h1)]

console.log(
  write(
    '1.json',
    JSON.stringify(from_to),
  )
)
