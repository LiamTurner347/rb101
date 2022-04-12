def cleanup(string)
  string.tr("^a-z", " ").squeeze(" ")
end

p cleanup("---what's my +*& line?")       # == ' what s my line '
