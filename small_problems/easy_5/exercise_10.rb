def print_in_box(message)
  if message.length >= 76
    message = message[0,76]
  end

  horizontal_rule = "+#{"-" * (message.length + 2)}+"
  empty_line = "|#{" " * (message.length + 2)}|"
  message_line = "| #{message} |"

  puts horizontal_rule
  puts empty_line
  puts message_line
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end

print_in_box("She knew as soon as she rejected the job that it was the wrong decision to make and she regretted it"
)