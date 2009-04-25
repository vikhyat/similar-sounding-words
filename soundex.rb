# Modified version of http://snippets.dzone.com/posts/show/4530
def soundex(string)
  chars     = 'BPFVCSKGJQXZDTLMNR'
  nums      = '111122222222334556'
  chars_ex  = '^BPFVCSKGJQXZDTLMNR'
  chars_del = '^A-Z'

        str = string.upcase.delete(chars_del).squeeze

        str[0 .. 0] + str[1 .. -1].
            delete(chars_ex).
            tr(chars, nums)[0 .. (2)].
            ljust(3, '0') rescue ''

end
