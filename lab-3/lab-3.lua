lgi = require 'lgi' 

gdk = lgi.Gdk
gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-3.glade')

prov = gtk.CssProvider()
prov:load_from_path('BlueColor.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr,prov,gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

opt = {ui.rButton1, ui.rButton2, ui.rButton3, ui.rButton4, ui.rButton5, ui.rButton6, ui.rButton7, ui.rButton8}

function update()
	x = 0
	y = 0
	z = 0
	if ui.chButton1.active == true then x = 1 end
	if ui.chButton2.active == true then y = 1 end
	if ui.chButton3.active == true then z = 1 end

	v = x + y * 2 + z * 4
    
	opt[v + 1].active = true 

	ui.lb.label = v
end

function ui.chButton1:on_clicked(...)
	update()
end

function ui.chButton2:on_clicked(...)
	update()
end

function ui.chButton3:on_clicked(...)
	update()
end

ui.wnd.title = 'lab-3'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
