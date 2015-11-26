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


module gio.IOExtension;

private import glib.Str;
private import gobject.ObjectG;
private import gobject.TypeClass;
private import gtkc.gio;
public  import gtkc.giotypes;


/**
 * #GIOExtension is an opaque data structure and can only be accessed
 * using the following functions.
 */
public class IOExtension
{
	/** the main Gtk struct */
	protected GIOExtension* gIOExtension;

	/** Get the main Gtk struct */
	public GIOExtension* getIOExtensionStruct()
	{
		return gIOExtension;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gIOExtension;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GIOExtension* gIOExtension)
	{
		this.gIOExtension = gIOExtension;
	}


	/**
	 * Gets the name under which @extension was registered.
	 *
	 * Note that the same type may be registered as extension
	 * for multiple extension points, under different names.
	 *
	 * Return: the name of @extension.
	 */
	public string getName()
	{
		return Str.toString(g_io_extension_get_name(gIOExtension));
	}

	/**
	 * Gets the priority with which @extension was registered.
	 *
	 * Return: the priority of @extension
	 */
	public int getPriority()
	{
		return g_io_extension_get_priority(gIOExtension);
	}

	/**
	 * Gets the type associated with @extension.
	 *
	 * Return: the type of @extension
	 */
	public GType getType()
	{
		return g_io_extension_get_type(gIOExtension);
	}

	/**
	 * Gets a reference to the class for the type that is
	 * associated with @extension.
	 *
	 * Return: the #GTypeClass for the type of @extension
	 */
	public TypeClass refClass()
	{
		auto p = g_io_extension_ref_class(gIOExtension);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(TypeClass)(cast(GTypeClass*) p);
	}
}
