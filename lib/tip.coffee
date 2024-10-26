HIGHLIGHT = 1

< (li)=>
  state = 0
  r = []
  t = []
  for i from li
    ts = i.trimStart()
    if ts.startsWith(':::')
      if ts.length > 3
        state = HIGHLIGHT
      else
        if t.length
          kind = t.shift()
          t = t.join('\n').trim().split('\n')
          if kind.includes 'tip'
            kind = '[!NOTE]'
          else if kind.includes 'caution'
            kind = '[!WARN]'
          else
            kind = '[!TIP]'

          t.unshift kind
          t = t.map (i)=>if i then '> '+i else '>'
          r.push ...t
        state = 0
        t = []
        continue
    if state
      t.push i
    else
      r.push i
  if t.length
    r.push ...t
  return r
