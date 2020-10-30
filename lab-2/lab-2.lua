lgi = require 'lgi' 

gdk = lgi.Gdk
gtk = lgi.Gtk
gtk.init()

bld= gtk.Builder()
bld:add_from_file('lab-2.glade')

prov = gtk.CssProvider()
prov:load_from_path('RedColor.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr,prov,
gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

function ui.btn_dd:on_clicked(...)
a = tonumber(ui.text_a.text)
b = tonumber(ui.text_b.text)
ui.result.label = a + b
end


function ui.btn_sub:on_clicked(...)
a = tonumber(ui.text_a.text)
b = tonumber(ui.text_b.text)
if a > b then
ui.result.label = a - b
end
if a < b then
print "FAULT! a < b!"
ui.result.label = "FAULT! b = 0!"
end
end

function ui.btn_umn:on_clicked(...)
a = tonumber(ui.text_a.text)
b = tonumber(ui.text_b.text)
ui.result.label = a * b
end

function ui.btn_del:on_clicked(...)
a = tonumber(ui.text_a.text)
b = tonumber(ui.text_b.text)
if b ~= 0 then
ui.result.label = a / b
end
if b == 0 then
print "FAULT! b = 0!"
ui.result.label = "FAULT! b = 0!"
end
end

function ui.btn_sin:on_clicked(...)
a = tonumber(ui.text_a.text)
b = tonumber(ui.text_b.text)
sa = math.sin(a)
ui.result.label = sa
end

function ui.btn_cos:on_clicked(...)
a = tonumber(ui.text_a.text)
b = tonumber(ui.text_b.text)
ca = math.cos(a)
ui.result.label = ca
end

function ui.btn_mod:on_clicked(...)
a = tonumber(ui.text_a.text)
b = tonumber(ui.text_b.text)
ui.result.label = math.fmod(a,b)
end

ui.wnd.title = 'lab-2'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()




