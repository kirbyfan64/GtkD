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

module dglib.ThreadG;

public:
enum ThreadPriority
{
  LOW,
  NORMAL,
  HIGH,
  URGENT
};


private:

alias ThreadPriority GThreadPriority;
alias void* GThreadFunc;


private import def.Types;
private import dglib.ErrorG;

extern(C) struct      GCond;
extern(C) struct      GMutex;

extern(C)
{
	
	struct GThreadFunctions
	{
		GMutex*  (*mutex_new)           ();
		void     (*mutex_lock)          (GMutex               *mutex);
		gboolean (*mutex_trylock)       (GMutex               *mutex);
		void     (*mutex_unlock)        (GMutex               *mutex);
		void     (*mutex_free)          (GMutex               *mutex);
		GCond*   (*cond_new)            ();
		void     (*cond_signal)         (GCond                *cond);
		void     (*cond_broadcast)      (GCond                *cond);
		void     (*cond_wait)           (GCond                *cond,
									   GMutex               *mutex);
		gboolean (*cond_timed_wait)     (GCond                *cond,
									   GMutex               *mutex,
									   GTimeVal             *end_time);
		void      (*cond_free)          (GCond                *cond);
		GPrivate* (*private_new)        (GDestroyNotify        destructor);
		gpointer  (*private_get)        (GPrivate             *private_key);
		void      (*private_set)        (GPrivate             *private_key,
									   gpointer              data);
		void      (*thread_create)      (GThreadFunc           func,
									   gpointer              data,
									   gulong                stack_size,
									   gboolean              joinable,
									   gboolean              bound,
									   GThreadPriority       priority,
									   gpointer              thread,
									   GError              **error);
		void      (*thread_yield)       ();
		void      (*thread_join)        (gpointer              thread);
		void      (*thread_exit)        ();
		void      (*thread_set_priority)(gpointer              thread,
									   GThreadPriority       priority);
		void      (*thread_self)        (gpointer              thread);
		gboolean  (*thread_equal)       (gpointer              thread1,
					   gpointer              thread2);
};

	
	gboolean    g_thread_supported              ();

	//gpointer    (*GThreadFunc)                  (gpointer data);
	struct      GThread;
	//GThread*    g_thread_create                 (GThreadFunc func, gpointer data, gboolean joinable, GError **error);
	GThread*    g_thread_create_full            (GThreadFunc func, gpointer data, gulong stack_size,
												 gboolean joinable, gboolean bound,
												 GThreadPriority priority, GError **error);
	GThread*    g_thread_self                   ();
	gpointer    g_thread_join                   (GThread *thread);
	void        g_thread_set_priority           (GThread *thread, GThreadPriority priority);
	void        g_thread_yield                  ();
	void        g_thread_exit                   (gpointer retval);
	
	GMutex*     g_mutex_new                     ();
	void        g_mutex_lock                    (GMutex *mutex);
	gboolean    g_mutex_trylock                 (GMutex *mutex);
	void        g_mutex_unlock                  (GMutex *mutex);
	void        g_mutex_free                    (GMutex *mutex);
	
	struct      GStaticMutex;
	void        g_static_mutex_init             (GStaticMutex *mutex);
	void        g_static_mutex_lock             (GStaticMutex *mutex);
	gboolean    g_static_mutex_trylock          (GStaticMutex *mutex);
	void        g_static_mutex_unlock           (GStaticMutex *mutex);
	GMutex*     g_static_mutex_get_mutex        (GStaticMutex *mutex);
	void        g_static_mutex_free             (GStaticMutex *mutex);
	
	struct      GStaticRecMutex;
	void        g_static_rec_mutex_init         (GStaticRecMutex *mutex);
	void        g_static_rec_mutex_lock         (GStaticRecMutex *mutex);
	gboolean    g_static_rec_mutex_trylock      (GStaticRecMutex *mutex);
	void        g_static_rec_mutex_unlock       (GStaticRecMutex *mutex);
	void        g_static_rec_mutex_lock_full    (GStaticRecMutex *mutex, guint depth);
	guint       g_static_rec_mutex_unlock_full  (GStaticRecMutex *mutex);
	void        g_static_rec_mutex_free         (GStaticRecMutex *mutex);
	
	struct      GStaticRWLock;
	void        g_static_rw_lock_init           (GStaticRWLock *lock);
	void        g_static_rw_lock_reader_lock    (GStaticRWLock *lock);
	gboolean    g_static_rw_lock_reader_trylock (GStaticRWLock *lock);
	void        g_static_rw_lock_reader_unlock  (GStaticRWLock *lock);
	void        g_static_rw_lock_writer_lock    (GStaticRWLock *lock);
	gboolean    g_static_rw_lock_writer_trylock (GStaticRWLock *lock);
	void        g_static_rw_lock_writer_unlock  (GStaticRWLock *lock);
	void        g_static_rw_lock_free           (GStaticRWLock *lock);
	
	GCond*      g_cond_new                      ();
	void        g_cond_signal                   (GCond *cond);
	void        g_cond_broadcast                (GCond *cond);
	void        g_cond_wait                     (GCond *cond,
												 GMutex *mutex);
	gboolean    g_cond_timed_wait               (GCond *cond, GMutex *mutex, GTimeVal *abs_time);
	void        g_cond_free                     (GCond *cond);
	
	struct      GPrivate;
	GPrivate*   g_private_new                   (GDestroyNotify destructor);
	gpointer    g_private_get                   (GPrivate *private_key);
	void        g_private_set                   (GPrivate *private_key,
												 gpointer data);
	
	struct      GStaticPrivate;
	void        g_static_private_init           (GStaticPrivate *private_key);
	gpointer    g_static_private_get            (GStaticPrivate *private_key);
	void        g_static_private_set            (GStaticPrivate *private_key, gpointer data, GDestroyNotify notify);
	void        g_static_private_free           (GStaticPrivate *private_key);
}

public:
class ThreadG
{
	
	protected:
	GThread* gThread;
	
	this(GThread* gThread)
	{
		this.gThread = gThread;
	}
	
	public:
	
	//this(void* func, void* data, bit joinable, GError** error)
	//{
	//	this(g_thread_create(func, data, joinable, error));
	//}
	
	this(void* func, void* data, gulong stack_size, bit joinable, bit bound, ThreadPriority priority, GError **error)
	{
		this(g_thread_create_full(func, data, stack_size, joinable, bound, priority, error));
	}
	
	ThreadG self()
	{
		return new ThreadG(g_thread_self());
	}
	
	/+
	static bit supported()
	{
		return g_thread_supported() == 0 ? false : true;
	}
	
	gpointer    g_thread_join                   (GThread *thread);
	void        g_thread_set_priority           (GThread *thread, GThreadPriority priority);
	void        g_thread_yield                  ();
	void        g_thread_exit                   (gpointer retval);
	
	GMutex*     g_mutex_new                     ();
	void        g_mutex_lock                    (GMutex *mutex);
	gboolean    g_mutex_trylock                 (GMutex *mutex);
	void        g_mutex_unlock                  (GMutex *mutex);
	void        g_mutex_free                    (GMutex *mutex);
	
	void        g_static_mutex_init             (GStaticMutex *mutex);
	void        g_static_mutex_lock             (GStaticMutex *mutex);
	gboolean    g_static_mutex_trylock          (GStaticMutex *mutex);
	void        g_static_mutex_unlock           (GStaticMutex *mutex);
	GMutex*     g_static_mutex_get_mutex        (GStaticMutex *mutex);
	void        g_static_mutex_free             (GStaticMutex *mutex);
	
	void        g_static_rec_mutex_init         (GStaticRecMutex *mutex);
	void        g_static_rec_mutex_lock         (GStaticRecMutex *mutex);
	gboolean    g_static_rec_mutex_trylock      (GStaticRecMutex *mutex);
	void        g_static_rec_mutex_unlock       (GStaticRecMutex *mutex);
	void        g_static_rec_mutex_lock_full    (GStaticRecMutex *mutex, guint depth);
	guint       g_static_rec_mutex_unlock_full  (GStaticRecMutex *mutex);
	void        g_static_rec_mutex_free         (GStaticRecMutex *mutex);
	
	void        g_static_rw_lock_init           (GStaticRWLock *lock);
	void        g_static_rw_lock_reader_lock    (GStaticRWLock *lock);
	gboolean    g_static_rw_lock_reader_trylock (GStaticRWLock *lock);
	void        g_static_rw_lock_reader_unlock  (GStaticRWLock *lock);
	void        g_static_rw_lock_writer_lock    (GStaticRWLock *lock);
	gboolean    g_static_rw_lock_writer_trylock (GStaticRWLock *lock);
	void        g_static_rw_lock_writer_unlock  (GStaticRWLock *lock);
	void        g_static_rw_lock_free           (GStaticRWLock *lock);
	
	GCond*      g_cond_new                      ();
	void        g_cond_signal                   (GCond *cond);
	void        g_cond_broadcast                (GCond *cond);
	void        g_cond_wait                     (GCond *cond,
												 GMutex *mutex);
	gboolean    g_cond_timed_wait               (GCond *cond, GMutex *mutex, GTimeVal *abs_time);
	void        g_cond_free                     (GCond *cond);
	
	GPrivate*   g_private_new                   (GDestroyNotify destructor);
	gpointer    g_private_get                   (GPrivate *private_key);
	void        g_private_set                   (GPrivate *private_key,
												 gpointer data);
	
	void        g_static_private_init           (GStaticPrivate *private_key);
	gpointer    g_static_private_get            (GStaticPrivate *private_key);
	void        g_static_private_set            (GStaticPrivate *private_key, gpointer data, GDestroyNotify notify);
	void        g_static_private_free           (GStaticPrivate *private_key);
	+/
}
