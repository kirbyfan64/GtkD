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


module pango.PgAttributeShape;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtkc.pango;
public  import gtkc.pangotypes;
private import pango.PgAttribute;


/**
 * The #PangoAttrShape structure is used to represent attributes which
 * impose shape restrictions.
 */
public class PgAttributeShape : PgAttribute
{
	/** the main Gtk struct */
	protected PangoAttrShape* pangoAttrShape;

	/** Get the main Gtk struct */
	public PangoAttrShape* getPgAttributeShapeStruct()
	{
		return pangoAttrShape;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)pangoAttrShape;
	}

	protected override void setStruct(GObject* obj)
	{
		pangoAttrShape = cast(PangoAttrShape*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoAttrShape* pangoAttrShape)
	{
		this.pangoAttrShape = pangoAttrShape;
		super(cast(PangoAttribute*)pangoAttrShape);
	}


	/**
	 * Create a new shape attribute. A shape is used to impose a
	 * particular ink and logical rectangle on the result of shaping a
	 * particular glyph. This might be used, for instance, for
	 * embedding a picture or a widget inside a #PangoLayout.
	 *
	 * Params:
	 *     inkRect = ink rectangle to assign to each character
	 *     logicalRect = logical rectangle to assign to each character
	 *
	 * Return: the newly allocated #PangoAttribute,
	 *     which should be freed with pango_attribute_destroy().
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(PangoRectangle* inkRect, PangoRectangle* logicalRect)
	{
		auto p = pango_attr_shape_new(inkRect, logicalRect);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(PangoAttrShape*) p);
	}

	/**
	 * Like pango_attr_shape_new(), but a user data pointer is also
	 * provided; this pointer can be accessed when later
	 * rendering the glyph.
	 *
	 * Params:
	 *     inkRect = ink rectangle to assign to each character
	 *     logicalRect = logical rectangle to assign to each character
	 *     data = user data pointer
	 *     copyFunc = function to copy @data when the
	 *         attribute is copied. If %NULL, @data is simply
	 *         copied as a pointer.
	 *     destroyFunc = function to free @data when the
	 *         attribute is freed, or %NULL
	 *
	 * Return: the newly allocated #PangoAttribute, which should be
	 *     freed with pango_attribute_destroy().
	 *
	 * Since: 1.8
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(PangoRectangle* inkRect, PangoRectangle* logicalRect, void* data, PangoAttrDataCopyFunc copyFunc, GDestroyNotify destroyFunc)
	{
		auto p = pango_attr_shape_new_with_data(inkRect, logicalRect, data, copyFunc, destroyFunc);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_with_data");
		}
		
		this(cast(PangoAttrShape*) p);
	}
}
