
; __CLANG_OFFLOAD_BUNDLE____START__ openmp-nvptx64-nvidia-cuda
; ModuleID = 'a00.c'
source_filename = "a00.c"
target datalayout = "e-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@"_openmp_kernel_static_glob_rd$ptr" = internal addrspace(3) global i8* null
@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@__omp_offloading_10302_17c8691_main_l6_exec_mode = weak constant i8 1
@llvm.compiler.used = appending global [1 x i8*] [i8* @__omp_offloading_10302_17c8691_main_l6_exec_mode], section "llvm.metadata"

; Function Attrs: noinline norecurse nounwind
define internal void @__omp_offloading_10302_17c8691_main_l6_worker() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8, align 1
  store i8* null, i8** %1, align 8
  store i8 0, i8* %2, align 1
  br label %3

3:                                                ; preds = %15, %0
  call void @__kmpc_barrier_simple_spmd(%struct.ident_t* null, i32 0) #3
  %4 = call i1 @__kmpc_kernel_parallel(i8** %1, i16 1)
  %5 = zext i1 %4 to i8
  store i8 %5, i8* %2, align 1
  %6 = load i8*, i8** %1, align 8
  %7 = icmp eq i8* %6, null
  br i1 %7, label %16, label %8

8:                                                ; preds = %3
  %9 = load i8, i8* %2, align 1
  %10 = icmp ne i8 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %8
  %12 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @0)
  %13 = bitcast i8* %6 to void (i16, i32)*
  call void %13(i16 0, i32 %12)
  br label %14

14:                                               ; preds = %11
  call void @__kmpc_kernel_end_parallel()
  br label %15

15:                                               ; preds = %14, %8
  call void @__kmpc_barrier_simple_spmd(%struct.ident_t* null, i32 0) #3
  br label %3

16:                                               ; preds = %3
  ret void
}

; Function Attrs: noinline norecurse nounwind optnone
define weak void @__omp_offloading_10302_17c8691_main_l6(i64 %0) #1 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = bitcast i64* %2 to i32*
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.warpsize(), !range !11
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !range !12
  %6 = sub nuw i32 %5, %4
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !13
  %8 = icmp ult i32 %7, %6
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  call void @__omp_offloading_10302_17c8691_main_l6_worker() #4
  br label %24

10:                                               ; preds = %1
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !range !12
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.warpsize(), !range !11
  %13 = sub nuw i32 %12, 1
  %14 = xor i32 %13, -1
  %15 = sub nuw i32 %11, 1
  %16 = and i32 %15, %14
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !13
  %18 = icmp eq i32 %17, %16
  br i1 %18, label %19, label %24

19:                                               ; preds = %10
  %20 = call i32 @llvm.nvvm.read.ptx.sreg.warpsize(), !range !11
  %21 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x(), !range !12
  %22 = sub nuw i32 %21, %20
  call void @__kmpc_kernel_init(i32 %22, i16 1)
  call void @__kmpc_data_sharing_init_stack()
  store i32 1, i32* %3, align 8
  br label %23

23:                                               ; preds = %19
  call void @__kmpc_kernel_deinit(i16 1)
  call void @__kmpc_barrier_simple_spmd(%struct.ident_t* null, i32 0) #3
  br label %24

24:                                               ; preds = %23, %10, %9
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.warpsize() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nounwind readnone
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

declare void @__kmpc_kernel_init(i32, i16)

declare void @__kmpc_data_sharing_init_stack()

declare void @__kmpc_kernel_deinit(i16)

; Function Attrs: convergent
declare void @__kmpc_barrier_simple_spmd(%struct.ident_t*, i32) #3

declare i1 @__kmpc_kernel_parallel(i8**, i16)

declare i32 @__kmpc_global_thread_num(%struct.ident_t*)

declare void @__kmpc_kernel_end_parallel()

attributes #0 = { noinline norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_60" "target-features"="+ptx64,+sm_60" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_60" "target-features"="+ptx64,+sm_60" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { convergent }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!omp_offload.info = !{!3}
!nvvm.annotations = !{!4, !5, !6, !5, !7, !7, !7, !7, !8, !8, !7}
!llvm.ident = !{!9}
!nvvmir.version = !{!10}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 1]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 0, i32 66306, i32 24938129, !"main", i32 6, i32 0}
!4 = !{void (i64)* @__omp_offloading_10302_17c8691_main_l6, !"kernel", i32 1}
!5 = !{null, !"align", i32 8}
!6 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!7 = !{null, !"align", i32 16}
!8 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!9 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git 5b5274eaf8c26064b6d10b43171f6252c10f576e)"}
!10 = !{i32 1, i32 4}
!11 = !{i32 32, i32 33}
!12 = !{i32 1, i32 1025}
!13 = !{i32 0, i32 1024}

; __CLANG_OFFLOAD_BUNDLE____END__ openmp-nvptx64-nvidia-cuda

; __CLANG_OFFLOAD_BUNDLE____START__ host-x86_64-unknown-linux-gnu
; ModuleID = '/tmp/a00-94b5bb.bc'
source_filename = "a00.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__tgt_offload_entry = type { i8*, i8*, i64, i32, i32 }
%struct.__tgt_device_image = type { i8*, i8*, %struct.__tgt_offload_entry*, %struct.__tgt_offload_entry* }
%struct.__tgt_bin_desc = type { i32, %struct.__tgt_device_image*, %struct.__tgt_offload_entry*, %struct.__tgt_offload_entry* }

$.omp_offloading.descriptor_reg.nvptx64-nvidia-cuda = comdat any

@.__omp_offloading_10302_17c8691_main_l6.region_id = weak constant i8 0
@.offload_sizes = private unnamed_addr constant [1 x i64] [i64 4]
@.offload_maptypes = private unnamed_addr constant [1 x i64] [i64 800]
@.omp_offloading.entry_name = internal unnamed_addr constant [39 x i8] c"__omp_offloading_10302_17c8691_main_l6\00"
@.omp_offloading.entry.__omp_offloading_10302_17c8691_main_l6 = weak constant %struct.__tgt_offload_entry { i8* @.__omp_offloading_10302_17c8691_main_l6.region_id, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.omp_offloading.entry_name, i32 0, i32 0), i64 0, i32 0, i32 0 }, section "omp_offloading_entries", align 1
@__start_omp_offloading_entries = external hidden constant %struct.__tgt_offload_entry
@__stop_omp_offloading_entries = external hidden constant %struct.__tgt_offload_entry
@.omp_offloading.img_start.nvptx64-nvidia-cuda = extern_weak constant i8
@.omp_offloading.img_end.nvptx64-nvidia-cuda = extern_weak constant i8
@.omp_offloading.device_images = internal unnamed_addr constant [1 x %struct.__tgt_device_image] [%struct.__tgt_device_image { i8* @.omp_offloading.img_start.nvptx64-nvidia-cuda, i8* @.omp_offloading.img_end.nvptx64-nvidia-cuda, %struct.__tgt_offload_entry* @__start_omp_offloading_entries, %struct.__tgt_offload_entry* @__stop_omp_offloading_entries }], comdat($.omp_offloading.descriptor_reg.nvptx64-nvidia-cuda), align 8
@.omp_offloading.descriptor = internal constant %struct.__tgt_bin_desc { i32 1, %struct.__tgt_device_image* getelementptr inbounds ([1 x %struct.__tgt_device_image], [1 x %struct.__tgt_device_image]* @.omp_offloading.device_images, i32 0, i32 0), %struct.__tgt_offload_entry* @__start_omp_offloading_entries, %struct.__tgt_offload_entry* @__stop_omp_offloading_entries }, comdat($.omp_offloading.descriptor_reg.nvptx64-nvidia-cuda), align 8
@__dso_handle = external hidden global i8
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @.omp_offloading.requires_reg, i8* null }, { i32, void ()*, i8* } { i32 0, void ()* @.omp_offloading.descriptor_reg.nvptx64-nvidia-cuda, i8* bitcast (void ()* @.omp_offloading.descriptor_reg.nvptx64-nvidia-cuda to i8*) }]

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca [1 x i8*], align 8
  %10 = alloca [1 x i8*], align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 0, i32* %6, align 4
  store i32 100, i32* %7, align 4
  %11 = load i32, i32* %6, align 4
  %12 = bitcast i64* %8 to i32*
  store i32 %11, i32* %12, align 4
  %13 = load i64, i64* %8, align 8
  %14 = getelementptr inbounds [1 x i8*], [1 x i8*]* %9, i32 0, i32 0
  %15 = bitcast i8** %14 to i64*
  store i64 %13, i64* %15, align 8
  %16 = getelementptr inbounds [1 x i8*], [1 x i8*]* %10, i32 0, i32 0
  %17 = bitcast i8** %16 to i64*
  store i64 %13, i64* %17, align 8
  %18 = getelementptr inbounds [1 x i8*], [1 x i8*]* %9, i32 0, i32 0
  %19 = getelementptr inbounds [1 x i8*], [1 x i8*]* %10, i32 0, i32 0
  %20 = call i32 @__tgt_target(i64 -1, i8* @.__omp_offloading_10302_17c8691_main_l6.region_id, i32 1, i8** %18, i8** %19, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_sizes, i32 0, i32 0), i64* getelementptr inbounds ([1 x i64], [1 x i64]* @.offload_maptypes, i32 0, i32 0))
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %2
  call void @__omp_offloading_10302_17c8691_main_l6(i64 %13) #3
  br label %23

23:                                               ; preds = %22, %2
  ret i32 0
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @__omp_offloading_10302_17c8691_main_l6(i64 %0) #1 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = bitcast i64* %2 to i32*
  store i32 1, i32* %3, align 8
  ret void
}

declare dso_local i32 @__tgt_target(i64, i8*, i32, i8**, i8**, i64*, i64*)

; Function Attrs: noinline nounwind uwtable
define internal void @.omp_offloading.requires_reg() #2 section ".text.startup" {
  call void @__tgt_register_requires(i64 1)
  ret void
}

declare dso_local void @__tgt_register_requires(i64)

; Function Attrs: noinline nounwind uwtable
define internal void @.omp_offloading.descriptor_unreg(i8* %0) #2 section ".text.startup" comdat($.omp_offloading.descriptor_reg.nvptx64-nvidia-cuda) {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = call i32 @__tgt_unregister_lib(%struct.__tgt_bin_desc* @.omp_offloading.descriptor)
  ret void
}

declare dso_local i32 @__tgt_unregister_lib(%struct.__tgt_bin_desc*)

; Function Attrs: noinline nounwind uwtable
define linkonce hidden void @.omp_offloading.descriptor_reg.nvptx64-nvidia-cuda() #2 section ".text.startup" comdat {
  %1 = call i32 @__tgt_register_lib(%struct.__tgt_bin_desc* @.omp_offloading.descriptor)
  %2 = call i32 @__cxa_atexit(void (i8*)* @.omp_offloading.descriptor_unreg, i8* bitcast (%struct.__tgt_bin_desc* @.omp_offloading.descriptor to i8*), i8* @__dso_handle) #3
  ret void
}

declare dso_local i32 @__tgt_register_lib(%struct.__tgt_bin_desc*)

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!omp_offload.info = !{!0}
!llvm.module.flags = !{!1}
!llvm.ident = !{!2}

!0 = !{i32 0, i32 66306, i32 24938129, !"main", i32 6, i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git 5b5274eaf8c26064b6d10b43171f6252c10f576e)"}

; __CLANG_OFFLOAD_BUNDLE____END__ host-x86_64-unknown-linux-gnu
