require 'mkmf'
extension_name = 'evt_ext'
create_header
dir_config(extension_name)

have_library('liburing')
have_header('liburing.h')
have_header('sys/epoll.h')
have_header('sys/event.h')

create_makefile(extension_name)