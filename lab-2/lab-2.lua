lgi = require 'lgi' 

gtk = lgi.Gtk
gtk.init()

bld= gtk.Builder()
bld:add_from_file('lab-2.glade')

ob = bld.objects

function ob.btn_sub:on_clicked(...)
a = tonamber(ob.txt_a.text)
b = tonamber(ob.txt_b.text)
ob.lbl_res.label = a - b
end

function ob.btn_umn:on_clicked(...)
a = tonamber(ob.txt_a.text)
b = tonamber(ob.txt_b.text)
ob.lbl_res.label = a * b
end

function ob.btn_del:on_clicked(...)
a = tonamber(ob.txt_a.text)
b = tonamber(ob.txt_b.text)
ob.lbl_res.label = a / b
end


