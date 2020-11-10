lgi = require 'lgi' 
sqlite = require 'lsqlite3'

gtk = lgi.Gtk
pixbuf = lgi.GtkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-6.glade')

ui = bld.object

rdr_txt = gtk.CellRendererText {}
rdr_pix = gtk.CellRendererPixbuf {}

c1 = gtk.TreeViewColumn { title = 'Name',   {rdr_txt, { text = 1 }} }
c2 = gtk.TreeViewColumn { title = 'Value',   {rdr_txt, { text = 2 }} }
c3 = gtk.TreeViewColumn { title = 'Image',   {rdr_pix, { pixbuf = 3 }} }

ui.lstItems:append_column(c1)
ui.lstItems:append_column(c2)
ui.lstItems:append_column(c3)

db = sqlite.open('lab-6.db')

for row in db:nrows('SELECT * FROM list') do
	px = pixbuf.new_from_file(row.image)

	el.ui.stor_items:append()
	ui.stor_items[el] = { [1] = row.name, [2] = row.value 	[3] = px }
end
db:close()
