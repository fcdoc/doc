
< (li)=>
  md = li.join('\n')
  md.replace(
    /\n(.*)<details>([\s\S]*?)<\/details>/g,
    (_,t,code)=>
      if t
        t += '\n'
      t = '\n'+t

      [title, txt] = code.split('</summary>')
      title = title.replace('<summary>','').trim()

      r = '\n\n|+| '+ title + '\n'
      txt = txt.trimEnd().split('\n')

      while txt.length
        if txt[0].trim()
          break
        else
          txt.shift()

      if txt.length
        base_indent = txt[0].trimStart().length - txt[0].length
        li = []
        for i from txt
          trim_start = i.trimStart()
          if not trim_start
            li.push i
            continue
          indent = trim_start.length - i.length
          if indent >= base_indent
            li.push i.slice(base_indent)
          else
            li.push trim_start
        r += '\n    '+li.join('\n    ')

      return r
  ).split('\n')
