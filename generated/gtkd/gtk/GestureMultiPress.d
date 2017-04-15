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


module gtk.GestureMultiPress;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Gesture;
private import gtk.GestureSingle;
private import gtk.Widget;
public  import gtkc.gdktypes;
private import gtkc.gtk;
public  import gtkc.gtktypes;
private import std.algorithm;


/**
 * #GtkGestureMultiPress is a #GtkGesture implementation able to recognize
 * multiple clicks on a nearby zone, which can be listened for through the
 * #GtkGestureMultiPress::pressed signal. Whenever time or distance between
 * clicks exceed the GTK+ defaults, #GtkGestureMultiPress::stopped is emitted,
 * and the click counter is reset.
 * 
 * Callers may also restrict the area that is considered valid for a >1
 * touch/button press through gtk_gesture_multi_press_set_area(), so any
 * click happening outside that area is considered to be a first click of
 * its own.
 */
public class GestureMultiPress : GestureSingle
{
	/** the main Gtk struct */
	protected GtkGestureMultiPress* gtkGestureMultiPress;

	/** Get the main Gtk struct */
	public GtkGestureMultiPress* getGestureMultiPressStruct()
	{
		return gtkGestureMultiPress;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkGestureMultiPress;
	}

	protected override void setStruct(GObject* obj)
	{
		gtkGestureMultiPress = cast(GtkGestureMultiPress*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkGestureMultiPress* gtkGestureMultiPress, bool ownedRef = false)
	{
		this.gtkGestureMultiPress = gtkGestureMultiPress;
		super(cast(GtkGestureSingle*)gtkGestureMultiPress, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_gesture_multi_press_get_type();
	}

	/**
	 * Returns a newly created #GtkGesture that recognizes single and multiple
	 * presses.
	 *
	 * Params:
	 *     widget = a #GtkWidget
	 *
	 * Return: a newly created #GtkGestureMultiPress
	 *
	 * Since: 3.14
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Widget widget)
	{
		auto p = gtk_gesture_multi_press_new((widget is null) ? null : widget.getWidgetStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GtkGestureMultiPress*) p, true);
	}

	/**
	 * If an area was set through gtk_gesture_multi_press_set_area(),
	 * this function will return %TRUE and fill in @rect with the
	 * press area. See gtk_gesture_multi_press_set_area() for more
	 * details on what the press area represents.
	 *
	 * Params:
	 *     rect = return location for the press area
	 *
	 * Return: %TRUE if @rect was filled with the press area
	 *
	 * Since: 3.14
	 */
	public bool getArea(out GdkRectangle rect)
	{
		return gtk_gesture_multi_press_get_area(gtkGestureMultiPress, &rect) != 0;
	}

	/**
	 * If @rect is non-%NULL, the press area will be checked to be
	 * confined within the rectangle, otherwise the button count
	 * will be reset so the press is seen as being the first one.
	 * If @rect is #NULL, the area will be reset to an unrestricted
	 * state.
	 *
	 * Note: The rectangle is only used to determine whether any
	 * non-first click falls within the expected area. This is not
	 * akin to an input shape.
	 *
	 * Params:
	 *     rect = rectangle to receive coordinates on
	 *
	 * Since: 3.14
	 */
	public void setArea(GdkRectangle* rect)
	{
		gtk_gesture_multi_press_set_area(gtkGestureMultiPress, rect);
	}

	protected class OnPressedDelegateWrapper
	{
		static OnPressedDelegateWrapper[] listeners;
		void delegate(int, double, double, GestureMultiPress) dlg;
		gulong handlerId;
		
		this(void delegate(int, double, double, GestureMultiPress) dlg)
		{
			this.dlg = dlg;
			this.listeners ~= this;
		}
		
		void remove(OnPressedDelegateWrapper source)
		{
			foreach(index, wrapper; listeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					listeners[index] = null;
					listeners = std.algorithm.remove(listeners, index);
					break;
				}
			}
		}
	}

	/**
	 * This signal is emitted whenever a button or touch press happens.
	 *
	 * Params:
	 *     nPress = how many touch/button presses happened with this one
	 *     x = The X coordinate, in widget allocation coordinates
	 *     y = The Y coordinate, in widget allocation coordinates
	 *
	 * Since: 3.14
	 */
	gulong addOnPressed(void delegate(int, double, double, GestureMultiPress) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnPressedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"pressed",
			cast(GCallback)&callBackPressed,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackPressedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}
	
	extern(C) static void callBackPressed(GtkGestureMultiPress* gesturemultipressStruct, int nPress, double x, double y, OnPressedDelegateWrapper wrapper)
	{
		wrapper.dlg(nPress, x, y, wrapper.outer);
	}
	
	extern(C) static void callBackPressedDestroy(OnPressedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnReleasedDelegateWrapper
	{
		static OnReleasedDelegateWrapper[] listeners;
		void delegate(int, double, double, GestureMultiPress) dlg;
		gulong handlerId;
		
		this(void delegate(int, double, double, GestureMultiPress) dlg)
		{
			this.dlg = dlg;
			this.listeners ~= this;
		}
		
		void remove(OnReleasedDelegateWrapper source)
		{
			foreach(index, wrapper; listeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					listeners[index] = null;
					listeners = std.algorithm.remove(listeners, index);
					break;
				}
			}
		}
	}

	/**
	 * This signal is emitted when a button or touch is released. @n_press
	 * will report the number of press that is paired to this event, note
	 * that #GtkGestureMultiPress::stopped may have been emitted between the
	 * press and its release, @n_press will only start over at the next press.
	 *
	 * Params:
	 *     nPress = number of press that is paired with this release
	 *     x = The X coordinate, in widget allocation coordinates
	 *     y = The Y coordinate, in widget allocation coordinates
	 *
	 * Since: 3.14
	 */
	gulong addOnReleased(void delegate(int, double, double, GestureMultiPress) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnReleasedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"released",
			cast(GCallback)&callBackReleased,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackReleasedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}
	
	extern(C) static void callBackReleased(GtkGestureMultiPress* gesturemultipressStruct, int nPress, double x, double y, OnReleasedDelegateWrapper wrapper)
	{
		wrapper.dlg(nPress, x, y, wrapper.outer);
	}
	
	extern(C) static void callBackReleasedDestroy(OnReleasedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}

	protected class OnStoppedDelegateWrapper
	{
		static OnStoppedDelegateWrapper[] listeners;
		void delegate(GestureMultiPress) dlg;
		gulong handlerId;
		
		this(void delegate(GestureMultiPress) dlg)
		{
			this.dlg = dlg;
			this.listeners ~= this;
		}
		
		void remove(OnStoppedDelegateWrapper source)
		{
			foreach(index, wrapper; listeners)
			{
				if (wrapper.handlerId == source.handlerId)
				{
					listeners[index] = null;
					listeners = std.algorithm.remove(listeners, index);
					break;
				}
			}
		}
	}

	/**
	 * This signal is emitted whenever any time/distance threshold has
	 * been exceeded.
	 *
	 * Since: 3.14
	 */
	gulong addOnStopped(void delegate(GestureMultiPress) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		auto wrapper = new OnStoppedDelegateWrapper(dlg);
		wrapper.handlerId = Signals.connectData(
			this,
			"stopped",
			cast(GCallback)&callBackStopped,
			cast(void*)wrapper,
			cast(GClosureNotify)&callBackStoppedDestroy,
			connectFlags);
		return wrapper.handlerId;
	}
	
	extern(C) static void callBackStopped(GtkGestureMultiPress* gesturemultipressStruct, OnStoppedDelegateWrapper wrapper)
	{
		wrapper.dlg(wrapper.outer);
	}
	
	extern(C) static void callBackStoppedDestroy(OnStoppedDelegateWrapper wrapper, GClosure* closure)
	{
		wrapper.remove(wrapper);
	}
}