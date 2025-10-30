# Xourtcut

This is a tiny plugin for [Xournal++](https://github.com/xournalpp/xournalpp),
version 1.1.x and 1.2.x.

## Installation

To set the plugin up on Linux, run

```bash
cd ~/.config/xournalpp/plugins
git clone https://github.com/kodebot/Xourtcut.git
```

To set the plugin up on MacOS, run

```bash
cd /Applications/Xournal++.app/Contents/Resources/plugins
git clone https://github.com/kodebot/Xourtcut.git
```

Restart Xournal++ and you should see the plugin in the plugins menu

## Keybindings

```text
a - Arrow tool (press again to toggle between arrow and double arrow)
c - Circle tool
d - Delete tool (must have an object selected)
e - Eraser tool
r - Rectangle tool
s - Select Region tool
n - Line tool
w - Pen tool
t - Text tool
m - LaTeX tool
f - Toggle Fill tool (must have selected a shape tool and fill will be cleared on tool change)
<Ctrl>f - Show Fill Opacity Dialog
z - Toggle Line Style (switches between plain, dashed, and dotted lines)

1 - White colour
2 - Red colour
3 - Green colour
4 - Blue colour
5 - Purple colour
6 - Yellow colour
7 - Pink colour
8 - Cyan colour
9 - Orange colour
0 - Black colour

- - Decrease Pen Size
= - Increase Pen Size

F2 - Show Next Layer (Current Page) 
F1 - Show Previous Layer (Current Page)
<Shift>h - Hide All Layers but 1 (All Page)
<Shift>l - Show Top Layer (All Page)
<Ctrl>l - Add New Top Layer (Current Page)
<Ctrl>h - Delete Top Layer (Current Page)
<Ctrl>k - Add New Layer Above Current (Current Page)
<Ctrl>j - Add New Layer Below Current (Current Page)
<Ctrl>b - Move Selection Layer Down and Add New Layer Below (useful to draw everything on one layer and then move it down for a presentation effect)
u - Move Selection Layer Up
b - Move Selection Layer Down
```
