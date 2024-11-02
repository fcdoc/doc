> is-chinese:isChinese
  @3-/half

< (li)=>
  r = []
  code = []
  in_code = 0

  for line from li
    trim = line.trimStart()

    if trim.startsWith '```'
      if in_code
        trim0 = code[0].trimStart()
        if ['```', '```i18n'].includes trim0
          :out
            for i from code.slice(1,-1)
              for c from i
                if isChinese c
                  code[0] = '```i18n'
                  break out

        r.push ...code.map(half)
        code = []
      in_code = !in_code
    if in_code
      code.push line
    else
      r.push line
  r.push ...code
  return r


  # r = []
  # for line from li
  #   if line
  #     has_cn = 0
  #     line = line.replace(
  #       /(`[^`]+`)/g
  #       (match, code) =>
  #         txt = code.slice(1,-1)
  #         for i from txt
  #           if isChinese i
  #             is_cn = 1
  #             break
  #         if not is_cn
  #           return code
  #         has_cn = 1
  #         '__'+txt.replaceAll(
  #           '<br>'
  #           '`<br>`'
  #         )+'__'
  #     )
  #     if has_cn
  #       line = line.replaceAll("**__",'__').replaceAll("__**",'__')
  #   r.push line
  # return r
