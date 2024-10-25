HIGHLIGHT = 1

< (md)=>
  state = 0
  r = []
  t = []
  for i from md.trim().replaceAll('\r\n','\n').split('\n')
    i = i.trimEnd()
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
  return r.join '\n'
