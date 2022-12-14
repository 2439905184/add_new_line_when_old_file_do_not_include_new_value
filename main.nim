# 此函数用于向txt添加新的行，仅当新的行的字符串和旧行字符串不重复时追加，覆盖旧文件
proc add_new_line_when_old_file_do_not_include_new_value() = 
  let old:seq[string] = toSeq(lines("test.txt"))
  var seqNew = old
  var newValue = "new"
  for v in 0..len(seqNew): #此处使用范围做迭代器，是因为在迭代时不能修改自身变量
    if not(newValue in seqNew):
      seqNew.add(newValue)
  echo "新值: ", seqNew
  # 写入
  var f:File = open("test.txt",fmWrite)
  for vv in seqNew:
    f.write(vv & "\n")
  f.close()
