/*
 * This file is part of dui.
 * 
 * dui is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 * 
 * dui is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with dui; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

module ddi.WindowG;

private import def.Types;
private import ddi.Drawable;

private:

extern(C)
{
/+
	GType gdk_window_object_get_type();
	GdkWindow * gdk_window_new(GdkWindow * parent, GdkWindowAttr * attributes, gint attributes_mask);
	void gdk_window_destroy(GdkWindow * window);
	GdkWindowType gdk_window_get_window_type(GdkWindow * window);
	GdkWindow * gdk_window_at_pointer(gint * win_x, gint * win_y);
	void gdk_window_show(GdkWindow * window);
	void gdk_window_hide(GdkWindow * window);
	void gdk_window_withdraw(GdkWindow * window);
	void gdk_window_show_unraised(GdkWindow * window);
	void gdk_window_move(GdkWindow * window, gint x, gint y);
	void gdk_window_resize(GdkWindow * window, gint width, gint height);
	void gdk_window_move_resize(GdkWindow * window, gint x, gint y, gint width, gint height);
	void gdk_window_reparent(GdkWindow * window, GdkWindow * new_parent, gint x, gint y);
	void gdk_window_clear(GdkWindow * window);
	void gdk_window_clear_area(GdkWindow * window, gint x, gint y, gint width, gint height);
	void gdk_window_clear_area_e(GdkWindow * window, gint x, gint y, gint width, gint height);
	void gdk_window_raise(GdkWindow * window);
	void gdk_window_lower(GdkWindow * window);
	void gdk_window_focus(GdkWindow * window, guint32 timestamp);
	void gdk_window_set_user_data(GdkWindow * window, gpointer user_data);
	void gdk_window_set_override_redirect(GdkWindow * window, gboolean override_redirect);
	void gdk_window_add_filter(GdkWindow * window, GdkFilterFunc funct, gpointer data);
	void gdk_window_remove_filter(GdkWindow * window, GdkFilterFunc funct, gpointer data);
	void gdk_window_scroll(GdkWindow * window, gint dx, gint dy);

	/*
	 * This allows for making shaped(partially transparent) windows
	 * - cool feature, needed for Drag and Drag for example.
	 *  The shape_mask can be the mask
	 *  from gdk_pixmap_create_from_xpm.   Stefan Wille
	 */
	void gdk_window_shape_combine_mask(GdkWindow * window, GdkBitmap * mask, gint x, gint y);
	void gdk_window_shape_combine_region(GdkWindow * window, GdkRegion * shape_region, gint offset_x, gint offset_y);

	/*
	 * This routine allows you to quickly take the shapes of all the child windows
	 * of a window and use their shapes as the shape mask for this window - useful
	 * for container windows that dont want to look like a big box
	 *
	 * - Raster
	 */
	void gdk_window_set_child_shapes(GdkWindow * window);

	/*
	 * This routine allows you to merge(ie ADD) child shapes to your
	 * own window's shape keeping its current shape and ADDING the child
	 * shapes to it.
	 *
	 * - Raster
	 */
	void gdk_window_merge_child_shapes(GdkWindow * window);

	/*
	 * Check if a window has been shown, and whether all its
	 * parents up to a toplevel have been shown, respectively.
	 * Note that a window that is_viewable below is not necessarily
	 * viewable in the X sense.
	 */
	gboolean gdk_window_is_visible(GdkWindow * window);
	gboolean gdk_window_is_viewable(GdkWindow * window);

	GdkWindowState gdk_window_get_state(GdkWindow * window);

	/* Set static bit gravity on the parent, and static
	 * window gravity on all children.
	 */
	gboolean gdk_window_set_static_gravities(GdkWindow * window, gboolean use_static);

	/* Functions to create/lookup windows from their native equivalents */
	//#ifndef GDK_MULTIHEAD_SAFE 
	GdkWindow * gdk_window_foreign_new(GdkNativeWindow anid);
	GdkWindow * gdk_window_lookup(GdkNativeWindow anid);
	//#endif 
	GdkWindow * gdk_window_foreign_new_for_display(GdkDisplay * display, GdkNativeWindow anid);
	GdkWindow * gdk_window_lookup_for_display(GdkDisplay * display, GdkNativeWindow anid);


	/* GdkWindow */

	//#ifndef GDK_DISABLE_DEPRECATED 
	void gdk_window_set_hints(GdkWindow * window, gint x, gint y, gint min_width, gint min_height, gint max_width, gint max_height, gint flags);
	//#endif 
	void gdk_window_set_type_hint(GdkWindow * window, GdkWindowTypeHint hint);
	void gdk_window_set_modal_hint(GdkWindow * window, gboolean modal);

	void gdk_window_set_skip_taskbar_hint(GdkWindow * window, gboolean skips_taskbar);
	void gdk_window_set_skip_pager_hint(GdkWindow * window, gboolean skips_pager);

	void gdk_window_set_geometry_hints(GdkWindow * window, GdkGeometry * geometry, GdkWindowHints geom_mask);
	void gdk_set_sm_client_id(gchar * sm_client_id);

	void gdk_window_begin_paint_rect(GdkWindow * window, GdkRectangle * rectangle);
	void gdk_window_begin_paint_region(GdkWindow * window, GdkRegion * region);
	void gdk_window_end_paint(GdkWindow * window);

	void gdk_window_set_title(GdkWindow * window, gchar * title);
	void gdk_window_set_role(GdkWindow * window, gchar * role);
	void gdk_window_set_transient_for(GdkWindow * window, GdkWindow * parent);
	void gdk_window_set_background(GdkWindow * window, GdkColor * color);
	void gdk_window_set_back_pixmap(GdkWindow * window, GdkPixmap * pixmap, gboolean parent_relative);
	void gdk_window_set_cursor(GdkWindow * window, GdkCursor * cursor);
	void gdk_window_get_user_data(GdkWindow * window, gpointer * data);
	void gdk_window_get_geometry(GdkWindow * window, gint * x, gint * y, gint * width, gint * height, gint * depth);
	void gdk_window_get_position(GdkWindow * window, gint * x, gint * y);
	gint gdk_window_get_origin(GdkWindow * window, gint * x, gint * y);

	//#if ! defined(GDK_DISABLE_DEPRECATED) || defined(GTK_COMPILATION)/* Used by gtk_handle_box_button_changed() */
	gboolean gdk_window_get_deskrelative_origin(GdkWindow * window, gint * x, gint * y);
	//#endif
	void gdk_window_get_root_origin(GdkWindow * window, gint * x, gint * y);
	void gdk_window_get_frame_extents(GdkWindow * window, GdkRectangle * rect);
	GdkWindow * gdk_window_get_pointer(GdkWindow * window, gint * x, gint * y, GdkModifierType * mask);
	GdkWindow * gdk_window_get_parent(GdkWindow * window);
	GdkWindow * gdk_window_get_toplevel(GdkWindow * window);

	GList * gdk_window_get_children(GdkWindow * window);
	GList * gdk_window_peek_children(GdkWindow * window);
	GdkEventMask gdk_window_get_events(GdkWindow * window);
	void gdk_window_set_events(GdkWindow * window, GdkEventMask event_mask);

	void gdk_window_set_icon_list(GdkWindow * window, GList * pixbufs);
	void gdk_window_set_icon(GdkWindow * window, GdkWindow * icon_window, GdkPixmap * pixmap, GdkBitmap * mask);
	void gdk_window_set_icon_name(GdkWindow * window, gchar * name);
	void gdk_window_set_group(GdkWindow * window, GdkWindow * leader);
	void gdk_window_set_decorations(GdkWindow * window, GdkWMDecoration decorations);
	gboolean gdk_window_get_decorations(GdkWindow * window, GdkWMDecoration * decorations);
	void gdk_window_set_functions(GdkWindow * window, GdkWMFunction functions);
	//#ifndef GDK_MULTIHEAD_SAFE 
	GList * gdk_window_get_toplevels();
	//#endif
	void gdk_window_iconify(GdkWindow * window);
	void gdk_window_deiconify(GdkWindow * window);
	void gdk_window_stick(GdkWindow * window);
	void gdk_window_unstick(GdkWindow * window);
	void gdk_window_maximize(GdkWindow * window);
	void gdk_window_unmaximize(GdkWindow * window);
	void gdk_window_fullscreen(GdkWindow * window);
	void gdk_window_unfullscreen(GdkWindow * window);

	void gdk_window_register_dnd(GdkWindow * window);

	void gdk_window_begin_resize_drag(GdkWindow * window, GdkWindowEdge edge, gint button, gint root_x, gint root_y, guint32 timestamp);
	void gdk_window_begin_move_drag(GdkWindow * window, gint button, gint root_x, gint root_y, guint32 timestamp);

	/* Interface for dirty-region queueing */
	void gdk_window_invalidate_rect(GdkWindow * window, GdkRectangle * rect, gboolean invalidate_children);
	void gdk_window_invalidate_region(GdkWindow * window, GdkRegion * region, gboolean invalidate_children);
	void gdk_window_invalidate_maybe_recurse(GdkWindow * window, GdkRegion * region, gboolean(*child_func)(GdkWindow * , gpointer), gpointer user_data);
	GdkRegion * gdk_window_get_update_area(GdkWindow * window);

	void gdk_window_freeze_updates(GdkWindow * window);
	void gdk_window_thaw_updates(GdkWindow * window);

	void gdk_window_process_all_updates();
	void gdk_window_process_updates(GdkWindow * window, gboolean update_children);

	/* Enable/disable flicker, so you can tell if your code is inefficient. */
	void gdk_window_set_debug_updates(gboolean setting);

	void gdk_window_constrain_size(GdkGeometry * geometry, guint flags, gint width, gint height, gint * new_width, gint * new_height);

	void gdk_window_get_internal_paint_info(GdkWindow * window, GdkDrawable * *real_drawable, gint * x_offset, gint * y_offset);

	//#ifndef GDK_MULTIHEAD_SAFE 
	GdkPointerHooks * gdk_set_pointer_hooks(GdkPointerHooks * new_hooks);
	//#endif /* GDK_MULTIHEAD_SAFE */

	GdkWindow * gdk_get_default_root_window();
+/
};

/**
 * WindowG wraps GdkWindow - low level window, not the application windows.
 * The methods on this class are not implement.
 * This class is not to be fully implemented on the version of DUI, whence it's not marked
 * as "todo" yet.
 */
public:
class WindowG : Drawable
{

	private import dui.Widget;
	public:

	debug(status)
	{
		int complete(){return 50;}
		char[] gtkName(){return "GdkWindow";}
		char[] description(){return "";}
		char[] author(){return "Antonio";}
	}

	/**
	 * Gets the GdkWindow of this WindoeG
	 * @return the GdkWindow of this WindowG
	 */
	GdkWindow* gdkW()
	{
		return cast(GdkWindow *) gObject;
	}

	/**
	 * Creates a new WindowG from a GdkObject
	 */
	this(GObject * gObject)
	{
		super (gObject);
	}

	/**
	 * Creates a new WindowG froma GdkWindow
	 */
	this(GdkWindow * gdkWindow)
	{
		super(cast(GObject*)gdkWindow);
	}

}
