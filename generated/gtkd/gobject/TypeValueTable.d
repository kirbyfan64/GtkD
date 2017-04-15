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


module gobject.TypeValueTable;

private import gtkc.gobject;
public  import gtkc.gobjecttypes;


/**
 * The #GTypeValueTable provides the functions required by the #GValue
 * implementation, to serve as a container for values of a type.
 */
public struct TypeValueTable
{

	/**
	 * Returns the location of the #GTypeValueTable associated with @type.
	 *
	 * Note that this function should only be used from source code
	 * that implements or has internal knowledge of the implementation of
	 * @type.
	 *
	 * Params:
	 *     type = a #GType
	 *
	 * Return: location of the #GTypeValueTable associated with @type or
	 *     %NULL if there is no #GTypeValueTable associated with @type
	 */
	public static GTypeValueTable* peek(GType type)
	{
		return g_type_value_table_peek(type);
	}
}