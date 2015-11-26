/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module pango.PgRenderer;

private import glib.Str;
private import gobject.ObjectG;
private import gtkc.pango;
public  import gtkc.pangotypes;
private import pango.PgColor;
private import pango.PgFont;
private import pango.PgGlyphItem;
private import pango.PgGlyphString;
private import pango.PgLayout;
private import pango.PgLayoutLine;
private import pango.PgMatrix;


/**
 * #PangoRenderer is a base class for objects that are used to
 * render Pango objects such as #PangoGlyphString and
 * #PangoLayout.
 *
 * Since: 1.8
 */
public class PgRenderer : ObjectG
{
	/** the main Gtk struct */
	protected PangoRenderer* pangoRenderer;

	/** Get the main Gtk struct */
	public PangoRenderer* getPgRendererStruct()
	{
		return pangoRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)pangoRenderer;
	}

	protected override void setStruct(GObject* obj)
	{
		pangoRenderer = cast(PangoRenderer*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoRenderer* pangoRenderer, bool ownedRef = false)
	{
		this.pangoRenderer = pangoRenderer;
		super(cast(GObject*)pangoRenderer, ownedRef);
	}


	public static GType getType()
	{
		return pango_renderer_get_type();
	}

	/**
	 * Does initial setup before rendering operations on @renderer.
	 * pango_renderer_deactivate() should be called when done drawing.
	 * Calls such as pango_renderer_draw_layout() automatically
	 * activate the layout before drawing on it. Calls to
	 * pango_renderer_activate() and pango_renderer_deactivate() can
	 * be nested and the renderer will only be initialized and
	 * deinitialized once.
	 *
	 * Since: 1.8
	 */
	public void activate()
	{
		pango_renderer_activate(pangoRenderer);
	}

	/**
	 * Cleans up after rendering operations on @renderer. See
	 * docs for pango_renderer_activate().
	 *
	 * Since: 1.8
	 */
	public void deactivate()
	{
		pango_renderer_deactivate(pangoRenderer);
	}

	/**
	 * Draw a squiggly line that approximately covers the given rectangle
	 * in the style of an underline used to indicate a spelling error.
	 * (The width of the underline is rounded to an integer number
	 * of up/down segments and the resulting rectangle is centered
	 * in the original rectangle)
	 *
	 * This should be called while @renderer is already active.  Use
	 * pango_renderer_activate() to activate a renderer.
	 *
	 * Params:
	 *     x = X coordinate of underline, in Pango units in user coordinate system
	 *     y = Y coordinate of underline, in Pango units in user coordinate system
	 *     width = width of underline, in Pango units in user coordinate system
	 *     height = height of underline, in Pango units in user coordinate system
	 *
	 * Since: 1.8
	 */
	public void drawErrorUnderline(int x, int y, int width, int height)
	{
		pango_renderer_draw_error_underline(pangoRenderer, x, y, width, height);
	}

	/**
	 * Draws a single glyph with coordinates in device space.
	 *
	 * Params:
	 *     font = a #PangoFont
	 *     glyph = the glyph index of a single glyph
	 *     x = X coordinate of left edge of baseline of glyph
	 *     y = Y coordinate of left edge of baseline of glyph
	 *
	 * Since: 1.8
	 */
	public void drawGlyph(PgFont font, PangoGlyph glyph, double x, double y)
	{
		pango_renderer_draw_glyph(pangoRenderer, (font is null) ? null : font.getPgFontStruct(), glyph, x, y);
	}

	/**
	 * Draws the glyphs in @glyph_item with the specified #PangoRenderer,
	 * embedding the text associated with the glyphs in the output if the
	 * output format supports it (PDF for example).
	 *
	 * Note that @text is the start of the text for layout, which is then
	 * indexed by <literal>@glyph_item->item->offset</literal>.
	 *
	 * If @text is %NULL, this simply calls pango_renderer_draw_glyphs().
	 *
	 * The default implementation of this method simply falls back to
	 * pango_renderer_draw_glyphs().
	 *
	 * Params:
	 *     text = the UTF-8 text that @glyph_item refers to, or %NULL
	 *     glyphItem = a #PangoGlyphItem
	 *     x = X position of left edge of baseline, in user space coordinates
	 *         in Pango units.
	 *     y = Y position of left edge of baseline, in user space coordinates
	 *         in Pango units.
	 *
	 * Since: 1.22
	 */
	public void drawGlyphItem(string text, PgGlyphItem glyphItem, int x, int y)
	{
		pango_renderer_draw_glyph_item(pangoRenderer, Str.toStringz(text), (glyphItem is null) ? null : glyphItem.getPgGlyphItemStruct(), x, y);
	}

	/**
	 * Draws the glyphs in @glyphs with the specified #PangoRenderer.
	 *
	 * Params:
	 *     font = a #PangoFont
	 *     glyphs = a #PangoGlyphString
	 *     x = X position of left edge of baseline, in user space coordinates
	 *         in Pango units.
	 *     y = Y position of left edge of baseline, in user space coordinates
	 *         in Pango units.
	 *
	 * Since: 1.8
	 */
	public void drawGlyphs(PgFont font, PgGlyphString glyphs, int x, int y)
	{
		pango_renderer_draw_glyphs(pangoRenderer, (font is null) ? null : font.getPgFontStruct(), (glyphs is null) ? null : glyphs.getPgGlyphStringStruct(), x, y);
	}

	/**
	 * Draws @layout with the specified #PangoRenderer.
	 *
	 * Params:
	 *     layout = a #PangoLayout
	 *     x = X position of left edge of baseline, in user space coordinates
	 *         in Pango units.
	 *     y = Y position of left edge of baseline, in user space coordinates
	 *         in Pango units.
	 *
	 * Since: 1.8
	 */
	public void drawLayout(PgLayout layout, int x, int y)
	{
		pango_renderer_draw_layout(pangoRenderer, (layout is null) ? null : layout.getPgLayoutStruct(), x, y);
	}

	/**
	 * Draws @line with the specified #PangoRenderer.
	 *
	 * Params:
	 *     line = a #PangoLayoutLine
	 *     x = X position of left edge of baseline, in user space coordinates
	 *         in Pango units.
	 *     y = Y position of left edge of baseline, in user space coordinates
	 *         in Pango units.
	 *
	 * Since: 1.8
	 */
	public void drawLayoutLine(PgLayoutLine line, int x, int y)
	{
		pango_renderer_draw_layout_line(pangoRenderer, (line is null) ? null : line.getPgLayoutLineStruct(), x, y);
	}

	/**
	 * Draws an axis-aligned rectangle in user space coordinates with the
	 * specified #PangoRenderer.
	 *
	 * This should be called while @renderer is already active.  Use
	 * pango_renderer_activate() to activate a renderer.
	 *
	 * Params:
	 *     part = type of object this rectangle is part of
	 *     x = X position at which to draw rectangle, in user space coordinates in Pango units
	 *     y = Y position at which to draw rectangle, in user space coordinates in Pango units
	 *     width = width of rectangle in Pango units in user space coordinates
	 *     height = height of rectangle in Pango units in user space coordinates
	 *
	 * Since: 1.8
	 */
	public void drawRectangle(PangoRenderPart part, int x, int y, int width, int height)
	{
		pango_renderer_draw_rectangle(pangoRenderer, part, x, y, width, height);
	}

	/**
	 * Draws a trapezoid with the parallel sides aligned with the X axis
	 * using the given #PangoRenderer; coordinates are in device space.
	 *
	 * Params:
	 *     part = type of object this trapezoid is part of
	 *     y1 = Y coordinate of top of trapezoid
	 *     x11 = X coordinate of left end of top of trapezoid
	 *     x21 = X coordinate of right end of top of trapezoid
	 *     y2 = Y coordinate of bottom of trapezoid
	 *     x12 = X coordinate of left end of bottom of trapezoid
	 *     x22 = X coordinate of right end of bottom of trapezoid
	 *
	 * Since: 1.8
	 */
	public void drawTrapezoid(PangoRenderPart part, double y1, double x11, double x21, double y2, double x12, double x22)
	{
		pango_renderer_draw_trapezoid(pangoRenderer, part, y1, x11, x21, y2, x12, x22);
	}

	/**
	 * Gets the current alpha for the specified part.
	 *
	 * Params:
	 *     part = the part to get the alpha for
	 *
	 * Return: the alpha for the specified part,
	 *     or 0 if it hasn't been set and should be
	 *     inherited from the environment.
	 *
	 * Since: 1.38
	 */
	public ushort getAlpha(PangoRenderPart part)
	{
		return pango_renderer_get_alpha(pangoRenderer, part);
	}

	/**
	 * Gets the current rendering color for the specified part.
	 *
	 * Params:
	 *     part = the part to get the color for
	 *
	 * Return: the color for the
	 *     specified part, or %NULL if it hasn't been set and should be
	 *     inherited from the environment.
	 *
	 * Since: 1.8
	 */
	public PgColor getColor(PangoRenderPart part)
	{
		auto p = pango_renderer_get_color(pangoRenderer, part);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgColor)(cast(PangoColor*) p);
	}

	/**
	 * Gets the layout currently being rendered using @renderer.
	 * Calling this function only makes sense from inside a subclass's
	 * methods, like in its draw_shape<!---->() for example.
	 *
	 * The returned layout should not be modified while still being
	 * rendered.
	 *
	 * Return: the layout, or %NULL if
	 *     no layout is being rendered using @renderer at this time.
	 *
	 * Since: 1.20
	 */
	public PgLayout getLayout()
	{
		auto p = pango_renderer_get_layout(pangoRenderer);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgLayout)(cast(PangoLayout*) p);
	}

	/**
	 * Gets the layout line currently being rendered using @renderer.
	 * Calling this function only makes sense from inside a subclass's
	 * methods, like in its draw_shape<!---->() for example.
	 *
	 * The returned layout line should not be modified while still being
	 * rendered.
	 *
	 * Return: the layout line, or %NULL
	 *     if no layout line is being rendered using @renderer at this time.
	 *
	 * Since: 1.20
	 */
	public PgLayoutLine getLayoutLine()
	{
		auto p = pango_renderer_get_layout_line(pangoRenderer);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgLayoutLine)(cast(PangoLayoutLine*) p);
	}

	/**
	 * Gets the transformation matrix that will be applied when
	 * rendering. See pango_renderer_set_matrix().
	 *
	 * Return: the matrix, or %NULL if no matrix has
	 *     been set (which is the same as the identity matrix). The returned
	 *     matrix is owned by Pango and must not be modified or freed.
	 *
	 * Since: 1.8
	 */
	public PgMatrix getMatrix()
	{
		auto p = pango_renderer_get_matrix(pangoRenderer);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgMatrix)(cast(PangoMatrix*) p);
	}

	/**
	 * Informs Pango that the way that the rendering is done
	 * for @part has changed in a way that would prevent multiple
	 * pieces being joined together into one drawing call. For
	 * instance, if a subclass of #PangoRenderer was to add a stipple
	 * option for drawing underlines, it needs to call
	 *
	 * <informalexample><programlisting>
	 * pango_renderer_part_changed (render, PANGO_RENDER_PART_UNDERLINE);
	 * </programlisting></informalexample>
	 *
	 * When the stipple changes or underlines with different stipples
	 * might be joined together. Pango automatically calls this for
	 * changes to colors. (See pango_renderer_set_color())
	 *
	 * Params:
	 *     part = the part for which rendering has changed.
	 *
	 * Since: 1.8
	 */
	public void partChanged(PangoRenderPart part)
	{
		pango_renderer_part_changed(pangoRenderer, part);
	}

	/**
	 * Sets the alpha for part of the rendering.
	 * Note that the alpha may only be used if a color is
	 * specified for @part as well.
	 *
	 * Params:
	 *     part = the part to set the alpha for
	 *     alpha = an alpha value between 1 and 65536, or 0 to unset the alpha
	 *
	 * Since: 1.38
	 */
	public void setAlpha(PangoRenderPart part, ushort alpha)
	{
		pango_renderer_set_alpha(pangoRenderer, part, alpha);
	}

	/**
	 * Sets the color for part of the rendering.
	 * Also see pango_renderer_set_alpha().
	 *
	 * Params:
	 *     part = the part to change the color of
	 *     color = the new color or %NULL to unset the current color
	 *
	 * Since: 1.8
	 */
	public void setColor(PangoRenderPart part, PgColor color)
	{
		pango_renderer_set_color(pangoRenderer, part, (color is null) ? null : color.getPgColorStruct());
	}

	/**
	 * Sets the transformation matrix that will be applied when rendering.
	 *
	 * Params:
	 *     matrix = a #PangoMatrix, or %NULL to unset any existing matrix.
	 *         (No matrix set is the same as setting the identity matrix.)
	 *
	 * Since: 1.8
	 */
	public void setMatrix(PgMatrix matrix)
	{
		pango_renderer_set_matrix(pangoRenderer, (matrix is null) ? null : matrix.getPgMatrixStruct());
	}
}
