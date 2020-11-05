
lgi = require 'lgi' 

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-5.glade')

ui = bld.objects

function ui.btn1:on_clicked(...)
	ui.wnd2:show_all()
end

function ui.btn2:on_clicked(...)
	ui.wnd2:hide()
	
end

function ui.btn3:on_clicked(...)
	msd:run()
end

msd = gtk.MessageDialog
{
	message_type = gtk.MessageType.INFO,
	buttons = gtk.ButtonsType.OK,
	text = "you chose wrong door",
	secondary_text = "eee, smart ass"
}



ui.wnd1.title = 'lab-5'
ui.wnd1.on_destroy = gtk.main_quit
ui.wnd1:show_all()

gtk.main()

