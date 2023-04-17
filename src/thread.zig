// Copyright 2023 XXIV
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
pub const THREAD_U64 = c_ulonglong;
pub const THREAD_STACK_SIZE_DEFAULT = @as(c_int, 0);
pub const THREAD_SIGNAL_WAIT_INFINITE = -@as(c_int, 1);
pub const THREAD_QUEUE_WAIT_INFINITE = -@as(c_int, 1);

pub const thread_id_t = ?*anyopaque;
pub const thread_ptr_t = ?*anyopaque;
pub const thread_mutex_t = opaque {};
pub const thread_signal_t = opaque {};
pub const thread_atomic_int_t = opaque {};
pub const thread_atomic_ptr_t = opaque {};
pub const thread_timer_t = opaque {};
pub const thread_tls_t = ?*anyopaque;
pub const thread_queue_t = opaque {};

pub extern "C" fn thread_current_thread_id() thread_id_t;
pub extern "C" fn thread_yield() void;
pub extern "C" fn thread_set_high_priority() void;
pub extern "C" fn thread_exit(return_code: c_int) void;
pub extern "C" fn thread_create(thread_proc: ?fn (?*anyopaque) callconv(.C) c_int, user_data: ?*anyopaque, stack_size: c_int) thread_ptr_t;
pub extern "C" fn thread_destroy(thread: thread_ptr_t) void;
pub extern "C" fn thread_join(thread: thread_ptr_t) c_int;
pub extern "C" fn thread_detach(thread: thread_ptr_t) c_int;
pub extern "C" fn thread_mutex_init(mutex: ?*thread_mutex_t) void;
pub extern "C" fn thread_mutex_term(mutex: ?*thread_mutex_t) void;
pub extern "C" fn thread_mutex_lock(mutex: ?*thread_mutex_t) void;
pub extern "C" fn thread_mutex_unlock(mutex: ?*thread_mutex_t) void;
pub extern "C" fn thread_signal_init(signal: ?*thread_signal_t) void;
pub extern "C" fn thread_signal_term(signal: ?*thread_signal_t) void;
pub extern "C" fn thread_signal_raise(signal: ?*thread_signal_t) void;
pub extern "C" fn thread_signal_wait(signal: ?*thread_signal_t, timeout_ms: c_int) c_int;
pub extern "C" fn thread_atomic_int_load(atomic: ?*thread_atomic_int_t) c_int;
pub extern "C" fn thread_atomic_int_store(atomic: ?*thread_atomic_int_t, desired: c_int) void;
pub extern "C" fn thread_atomic_int_inc(atomic: ?*thread_atomic_int_t) c_int;
pub extern "C" fn thread_atomic_int_dec(atomic: ?*thread_atomic_int_t) c_int;
pub extern "C" fn thread_atomic_int_add(atomic: ?*thread_atomic_int_t, value: c_int) c_int;
pub extern "C" fn thread_atomic_int_sub(atomic: ?*thread_atomic_int_t, value: c_int) c_int;
pub extern "C" fn thread_atomic_int_swap(atomic: ?*thread_atomic_int_t, desired: c_int) c_int;
pub extern "C" fn thread_atomic_int_compare_and_swap(atomic: ?*thread_atomic_int_t, expected: c_int, desired: c_int) c_int;
pub extern "C" fn thread_atomic_ptr_load(atomic: ?*thread_atomic_ptr_t) ?*anyopaque;
pub extern "C" fn thread_atomic_ptr_store(atomic: ?*thread_atomic_ptr_t, desired: ?*anyopaque) void;
pub extern "C" fn thread_atomic_ptr_swap(atomic: ?*thread_atomic_ptr_t, desired: ?*anyopaque) ?*anyopaque;
pub extern "C" fn thread_atomic_ptr_compare_and_swap(atomic: ?*thread_atomic_ptr_t, expected: ?*anyopaque, desired: ?*anyopaque) ?*anyopaque;
pub extern "C" fn thread_timer_init(timer: ?*thread_timer_t) void;
pub extern "C" fn thread_timer_term(timer: ?*thread_timer_t) void;
pub extern "C" fn thread_timer_wait(timer: ?*thread_timer_t, nanoseconds: THREAD_U64) void;
pub extern "C" fn thread_tls_create() thread_tls_t;
pub extern "C" fn thread_tls_destroy(tls: thread_tls_t) void;
pub extern "C" fn thread_tls_set(tls: thread_tls_t, value: ?*anyopaque) void;
pub extern "C" fn thread_tls_get(tls: thread_tls_t) ?*anyopaque;
pub extern "C" fn thread_queue_init(queue: ?*thread_queue_t, size: c_int, values: [*c]?*anyopaque, count: c_int) void;
pub extern "C" fn thread_queue_term(queue: ?*thread_queue_t) void;
pub extern "C" fn thread_queue_produce(queue: ?*thread_queue_t, value: ?*anyopaque, timeout_ms: c_int) c_int;
pub extern "C" fn thread_queue_consume(queue: ?*thread_queue_t, timeout_ms: c_int) ?*anyopaque;
pub extern "C" fn thread_queue_count(queue: ?*thread_queue_t) c_int;
