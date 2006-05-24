/*
 * This file is part of duit.
 *
 * duit is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * duit is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with duit; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */
 
// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage

/*
 * Conversion parameters:
 * outPack = gthread
 * outFile = StaticRecMutex
 * strct   = GStaticRecMutex
 * realStrct=
 * clss    = StaticRecMutex
 * interf  = 
 * class Code: No
 * interface Code: No
 * template for:
 * extend  = 
 * implements:
 * prefixes:
 * 	- g_static_rec_mutex_
 * omit structs:
 * omit prefixes:
 * omit code:
 * imports:
 * structWrap:
 * local aliases:
 */

module gthread.StaticRecMutex;

private import gthread.typedefs;

private import lib.gthread;


/**
 * Description
 * Threads act almost like processes, but unlike processes all threads of
 * one process share the same memory. This is good, as it provides easy
 * communication between the involved threads via this shared memory, and
 * it is bad, because strange things (so called Heisenbugs) might happen,
 * when the program is not carefully designed. Especially bad is, that due
 * to the concurrent nature of threads no assumptions on the order of
 * execution of different threads can be done unless explicitly forced by
 * the programmer through synchronization primitives.
 * The aim of the thread related functions in GLib is to provide a
 * portable means for writing multi-threaded software. There are
 * primitives for mutexes to protect the access to portions of memory
 * (GMutex, GStaticMutex, G_LOCK_DEFINE, GStaticRecMutex and
 * GStaticRWLock), there are primitives for condition variables to allow
 * synchronization of threads (GCond) and finally there are primitives
 * for thread-private data, that every thread has a private instance of
 * (GPrivate, GStaticPrivate). Last but definitely not least there are
 * primitives to portably create and manage threads (GThread).
 * You must call g_thread_init() before executing any other GLib functions
 * in a threaded GLib program. After that, GLib is completely thread safe
 * (all global data is automatically locked). But individual data structure
 * instances are not automatically locked for performance reasons. So e.g.
 * you must coordinate accesses to the same GHashTable from multiple threads.
 * The two notable exceptions from this rule are GMainLoop and GAsyncQueue,
 * which are threadsafe and needs no further
 * application-level locking to be accessed from multiple threads.
 */
public class StaticRecMutex
{
	
	/** the main Gtk struct */
	protected GStaticRecMutex* gStaticRecMutex;
	
	
	public GStaticRecMutex* getStaticRecMutexStruct()
	{
		return gStaticRecMutex;
	}
	
	
	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gStaticRecMutex;
	}
	
	/**
	 * Sets our main struct and passes it to the parent class
	 */
	public this (GStaticRecMutex* gStaticRecMutex)
	{
		this.gStaticRecMutex = gStaticRecMutex;
	}
	
	/**
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * A GStaticRecMutex must be initialized with this function, before it
	 * can be used. Alternatively you can initialize it with
	 * G_STATIC_REC_MUTEX_INIT.
	 * mutex:
	 * a GStaticRecMutex to be initialized.
	 */
	public void init()
	{
		// void g_static_rec_mutex_init (GStaticRecMutex *mutex);
		g_static_rec_mutex_init(gStaticRecMutex);
	}
	
	/**
	 * Locks mutex. If mutex is already locked by another thread, the
	 * current thread will block until mutex is unlocked by the other
	 * thread. If mutex is already locked by the calling thread, this
	 * functions increases the depth of mutex and returns immediately.
	 * mutex:
	 * a GStaticRecMutex to lock.
	 */
	public void lock()
	{
		// void g_static_rec_mutex_lock (GStaticRecMutex *mutex);
		g_static_rec_mutex_lock(gStaticRecMutex);
	}
	
	/**
	 * Tries to lock mutex. If mutex is already locked by another thread,
	 * it immediately returns FALSE. Otherwise it locks mutex and returns
	 * TRUE. If mutex is already locked by the calling thread, this
	 * functions increases the depth of mutex and immediately returns TRUE.
	 * mutex:
	 * a GStaticRecMutex to lock.
	 * Returns:
	 * TRUE, if mutex could be locked.
	 */
	public int trylock()
	{
		// gboolean g_static_rec_mutex_trylock (GStaticRecMutex *mutex);
		return g_static_rec_mutex_trylock(gStaticRecMutex);
	}
	
	/**
	 * Unlocks mutex. Another threads can, however, only lock mutex when it
	 * has been unlocked as many times, as it had been locked before. If
	 * mutex is completely unlocked and another thread is blocked in a
	 * g_static_rec_mutex_lock() call for mutex, it will be woken and can
	 * lock mutex itself.
	 * mutex:
	 * a GStaticRecMutex to unlock.
	 */
	public void unlock()
	{
		// void g_static_rec_mutex_unlock (GStaticRecMutex *mutex);
		g_static_rec_mutex_unlock(gStaticRecMutex);
	}
	
	/**
	 * Works like calling g_static_rec_mutex_lock() for mutex depth times.
	 * mutex:
	 * a GStaticRecMutex to lock.
	 * depth:
	 * number of times this mutex has to be unlocked to be completely unlocked.
	 */
	public void lockFull(uint depth)
	{
		// void g_static_rec_mutex_lock_full (GStaticRecMutex *mutex,  guint depth);
		g_static_rec_mutex_lock_full(gStaticRecMutex, depth);
	}
	
	/**
	 * Completely unlocks mutex. If another thread is blocked in a
	 * g_static_rec_mutex_lock() call for mutex, it will be woken and can
	 * lock mutex itself. This function returns the number of times, that
	 * mutex has been locked by the current thread. To restore the state
	 * before the call to g_static_rec_mutex_unlock_full() you can call
	 * g_static_rec_mutex_lock_full() with the depth returned by this
	 * function.
	 * mutex:
	 * a GStaticRecMutex to completely unlock.
	 * Returns:
	 * number of times mutex has been locked by the current thread.
	 */
	public uint unlockFull()
	{
		// guint g_static_rec_mutex_unlock_full (GStaticRecMutex *mutex);
		return g_static_rec_mutex_unlock_full(gStaticRecMutex);
	}
	
	/**
	 * Releases all resources allocated to a GStaticRecMutex.
	 * You don't have to call this functions for a GStaticRecMutex with an
	 * unbounded lifetime, i.e. objects declared 'static', but if you have a
	 * GStaticRecMutex as a member of a structure and the structure is
	 * freed, you should also free the GStaticRecMutex.
	 * mutex:
	 * a GStaticRecMutex to be freed.
	 */
	public void free()
	{
		// void g_static_rec_mutex_free (GStaticRecMutex *mutex);
		g_static_rec_mutex_free(gStaticRecMutex);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
