> is-chinese:isChinese

< (li)=>
  r = []
  for line from li
    if line
      has_cn = 0
      line = line.replace(
        /(`[^`]+`)/g
        (match, code) =>
          txt = code.slice(1,-1)
          for i from txt
            if isChinese i
              is_cn = 1
              break
          if not is_cn
            return code
          has_cn = 1
          '__'+txt.replaceAll(
            '<br>'
            '`<br>`'
          )+'__'
      )
      if has_cn
        line = line.replaceAll("**__",'__').replaceAll("__**",'__')
    r.push line
  return r
