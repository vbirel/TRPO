lgi = require 'lgi' 

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-3.glade')

ui = bld.objects

if ui.wnd.chButton1.checked == false and ui.wnd.chButton2.checked == false
then
ui.wnd.rButton.checked = true
ui.wnd.lb = "0"
end

ui.wnd.title = 'lab-3'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
