
lgi = require 'lgi'

gdk = lgi.Gdk
gtk = lgi.Gtk
pixbuf = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-4.glade')

prov = gtk.CssProvider()
prov:load_from_path('BlueColor.css')

ctx = gtk.StyleContext()
scr = gdk.Screen.get_default()
ctx.add_provider_for_screen(scr,prov,
gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)


ui = bld.objects

function ui.btnAdd:on_clicked(...)
    name = ui.txtName.text
    value = tonumber(ui.txtValue.text)
    pafOfPix = ui.txtPafOfPix.text

    px = pixbuf.new_from_file( pafOfPix )
    
    i = ui.mdl_items:append()
    
    ui.mdl_items[i]={ [1] = name, [2] = value, [3] = px }
end

rdr_txt = gtk.CellRendererText {}
rdr_pix = gtk.CellRendererPixbuf {}

c1 = gtk.TreeViewColumn { title = 'Name',   {rdr_txt, { text = 1 }} }
c2 = gtk.TreeViewColumn { title = 'Value',   {rdr_txt, { text = 2 }} }
c3 = gtk.TreeViewColumn { title = 'Image',   {rdr_pix, { pixbuf = 3 }} }

ui.lstItems:append_column(c1)
ui.lstItems:append_column(c2)
ui.lstItems:append_column(c3)

ui.wnd.title = 'lab-4'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
