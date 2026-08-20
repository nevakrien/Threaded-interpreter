; ModuleID = 'indirect.c'
source_filename = "indirect.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.IndirectVM = type { ptr, [64 x i64], ptr, [64 x ptr], ptr }
%struct.IndirectOpcode = type { ptr }
%union.IndirectCell = type { ptr }

@.str = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @indirect_run(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.IndirectVM, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %11, align 8
  %13 = getelementptr inbounds nuw %struct.IndirectOpcode, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  br label %181

15:                                               ; preds = %181
  call void asm sideeffect ".globl forth_indirect_push\0Aforth_indirect_push:\0A", "X,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@indirect_run, %15)) #2, !srcloc !6
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.IndirectVM, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds nuw %union.IndirectCell, ptr %18, i32 1
  store ptr %19, ptr %17, align 8
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.IndirectVM, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load i64, ptr %22, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.IndirectVM, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds nuw i64, ptr %26, i32 1
  store ptr %27, ptr %25, align 8
  store i64 %23, ptr %26, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.IndirectVM, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds nuw %union.IndirectCell, ptr %30, i32 1
  store ptr %31, ptr %29, align 8
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds nuw %struct.IndirectOpcode, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  br label %181

35:                                               ; preds = %181
  call void asm sideeffect ".globl forth_indirect_add\0Aforth_indirect_add:\0A", "X,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@indirect_run, %35)) #2, !srcloc !7
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr inbounds nuw %struct.IndirectVM, ptr %36, i32 0, i32 2
  %38 = load ptr, ptr %37, align 8
  %39 = getelementptr inbounds i64, ptr %38, i32 -1
  store ptr %39, ptr %37, align 8
  %40 = load i64, ptr %39, align 8
  store i64 %40, ptr %3, align 8
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds nuw %struct.IndirectVM, ptr %41, i32 0, i32 2
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds i64, ptr %43, i32 -1
  store ptr %44, ptr %42, align 8
  %45 = load i64, ptr %44, align 8
  store i64 %45, ptr %4, align 8
  %46 = load i64, ptr %4, align 8
  %47 = load i64, ptr %3, align 8
  %48 = add nsw i64 %46, %47
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr inbounds nuw %struct.IndirectVM, ptr %49, i32 0, i32 2
  %51 = load ptr, ptr %50, align 8
  %52 = getelementptr inbounds nuw i64, ptr %51, i32 1
  store ptr %52, ptr %50, align 8
  store i64 %48, ptr %51, align 8
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds nuw %struct.IndirectVM, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  %56 = getelementptr inbounds nuw %union.IndirectCell, ptr %55, i32 1
  store ptr %56, ptr %54, align 8
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds nuw %struct.IndirectOpcode, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  br label %181

60:                                               ; preds = %181
  call void asm sideeffect ".globl forth_indirect_sub\0Aforth_indirect_sub:\0A", "X,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@indirect_run, %60)) #2, !srcloc !8
  %61 = load ptr, ptr %2, align 8
  %62 = getelementptr inbounds nuw %struct.IndirectVM, ptr %61, i32 0, i32 2
  %63 = load ptr, ptr %62, align 8
  %64 = getelementptr inbounds i64, ptr %63, i32 -1
  store ptr %64, ptr %62, align 8
  %65 = load i64, ptr %64, align 8
  store i64 %65, ptr %5, align 8
  %66 = load ptr, ptr %2, align 8
  %67 = getelementptr inbounds nuw %struct.IndirectVM, ptr %66, i32 0, i32 2
  %68 = load ptr, ptr %67, align 8
  %69 = getelementptr inbounds i64, ptr %68, i32 -1
  store ptr %69, ptr %67, align 8
  %70 = load i64, ptr %69, align 8
  store i64 %70, ptr %6, align 8
  %71 = load i64, ptr %6, align 8
  %72 = load i64, ptr %5, align 8
  %73 = sub nsw i64 %71, %72
  %74 = load ptr, ptr %2, align 8
  %75 = getelementptr inbounds nuw %struct.IndirectVM, ptr %74, i32 0, i32 2
  %76 = load ptr, ptr %75, align 8
  %77 = getelementptr inbounds nuw i64, ptr %76, i32 1
  store ptr %77, ptr %75, align 8
  store i64 %73, ptr %76, align 8
  %78 = load ptr, ptr %2, align 8
  %79 = getelementptr inbounds nuw %struct.IndirectVM, ptr %78, i32 0, i32 0
  %80 = load ptr, ptr %79, align 8
  %81 = getelementptr inbounds nuw %union.IndirectCell, ptr %80, i32 1
  store ptr %81, ptr %79, align 8
  %82 = load ptr, ptr %81, align 8
  %83 = getelementptr inbounds nuw %struct.IndirectOpcode, ptr %82, i32 0, i32 0
  %84 = load ptr, ptr %83, align 8
  br label %181

85:                                               ; preds = %181
  call void asm sideeffect ".globl forth_indirect_mul\0Aforth_indirect_mul:\0A", "X,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@indirect_run, %85)) #2, !srcloc !9
  %86 = load ptr, ptr %2, align 8
  %87 = getelementptr inbounds nuw %struct.IndirectVM, ptr %86, i32 0, i32 2
  %88 = load ptr, ptr %87, align 8
  %89 = getelementptr inbounds i64, ptr %88, i32 -1
  store ptr %89, ptr %87, align 8
  %90 = load i64, ptr %89, align 8
  store i64 %90, ptr %7, align 8
  %91 = load ptr, ptr %2, align 8
  %92 = getelementptr inbounds nuw %struct.IndirectVM, ptr %91, i32 0, i32 2
  %93 = load ptr, ptr %92, align 8
  %94 = getelementptr inbounds i64, ptr %93, i32 -1
  store ptr %94, ptr %92, align 8
  %95 = load i64, ptr %94, align 8
  store i64 %95, ptr %8, align 8
  %96 = load i64, ptr %8, align 8
  %97 = load i64, ptr %7, align 8
  %98 = mul nsw i64 %96, %97
  %99 = load ptr, ptr %2, align 8
  %100 = getelementptr inbounds nuw %struct.IndirectVM, ptr %99, i32 0, i32 2
  %101 = load ptr, ptr %100, align 8
  %102 = getelementptr inbounds nuw i64, ptr %101, i32 1
  store ptr %102, ptr %100, align 8
  store i64 %98, ptr %101, align 8
  %103 = load ptr, ptr %2, align 8
  %104 = getelementptr inbounds nuw %struct.IndirectVM, ptr %103, i32 0, i32 0
  %105 = load ptr, ptr %104, align 8
  %106 = getelementptr inbounds nuw %union.IndirectCell, ptr %105, i32 1
  store ptr %106, ptr %104, align 8
  %107 = load ptr, ptr %106, align 8
  %108 = getelementptr inbounds nuw %struct.IndirectOpcode, ptr %107, i32 0, i32 0
  %109 = load ptr, ptr %108, align 8
  br label %181

110:                                              ; preds = %181
  call void asm sideeffect ".globl forth_indirect_dup\0Aforth_indirect_dup:\0A", "X,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@indirect_run, %110)) #2, !srcloc !10
  %111 = load ptr, ptr %2, align 8
  %112 = getelementptr inbounds nuw %struct.IndirectVM, ptr %111, i32 0, i32 2
  %113 = load ptr, ptr %112, align 8
  %114 = getelementptr inbounds i64, ptr %113, i64 -1
  %115 = load i64, ptr %114, align 8
  %116 = load ptr, ptr %2, align 8
  %117 = getelementptr inbounds nuw %struct.IndirectVM, ptr %116, i32 0, i32 2
  %118 = load ptr, ptr %117, align 8
  %119 = getelementptr inbounds nuw i64, ptr %118, i32 1
  store ptr %119, ptr %117, align 8
  store i64 %115, ptr %118, align 8
  %120 = load ptr, ptr %2, align 8
  %121 = getelementptr inbounds nuw %struct.IndirectVM, ptr %120, i32 0, i32 0
  %122 = load ptr, ptr %121, align 8
  %123 = getelementptr inbounds nuw %union.IndirectCell, ptr %122, i32 1
  store ptr %123, ptr %121, align 8
  %124 = load ptr, ptr %123, align 8
  %125 = getelementptr inbounds nuw %struct.IndirectOpcode, ptr %124, i32 0, i32 0
  %126 = load ptr, ptr %125, align 8
  br label %181

127:                                              ; preds = %181
  call void asm sideeffect ".globl forth_indirect_print\0Aforth_indirect_print:\0A", "X,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@indirect_run, %127)) #2, !srcloc !11
  %128 = load ptr, ptr %2, align 8
  %129 = getelementptr inbounds nuw %struct.IndirectVM, ptr %128, i32 0, i32 2
  %130 = load ptr, ptr %129, align 8
  %131 = getelementptr inbounds i64, ptr %130, i32 -1
  store ptr %131, ptr %129, align 8
  %132 = load i64, ptr %131, align 8
  %133 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %132)
  %134 = load ptr, ptr %2, align 8
  %135 = getelementptr inbounds nuw %struct.IndirectVM, ptr %134, i32 0, i32 0
  %136 = load ptr, ptr %135, align 8
  %137 = getelementptr inbounds nuw %union.IndirectCell, ptr %136, i32 1
  store ptr %137, ptr %135, align 8
  %138 = load ptr, ptr %137, align 8
  %139 = getelementptr inbounds nuw %struct.IndirectOpcode, ptr %138, i32 0, i32 0
  %140 = load ptr, ptr %139, align 8
  br label %181

141:                                              ; preds = %181
  call void asm sideeffect ".globl forth_indirect_call\0Aforth_indirect_call:\0A", "X,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@indirect_run, %141)) #2, !srcloc !12
  %142 = load ptr, ptr %2, align 8
  %143 = getelementptr inbounds nuw %struct.IndirectVM, ptr %142, i32 0, i32 0
  %144 = load ptr, ptr %143, align 8
  %145 = getelementptr inbounds nuw %union.IndirectCell, ptr %144, i32 1
  store ptr %145, ptr %143, align 8
  %146 = load ptr, ptr %2, align 8
  %147 = getelementptr inbounds nuw %struct.IndirectVM, ptr %146, i32 0, i32 0
  %148 = load ptr, ptr %147, align 8
  %149 = getelementptr inbounds %union.IndirectCell, ptr %148, i64 1
  %150 = load ptr, ptr %2, align 8
  %151 = getelementptr inbounds nuw %struct.IndirectVM, ptr %150, i32 0, i32 4
  %152 = load ptr, ptr %151, align 8
  %153 = getelementptr inbounds nuw ptr, ptr %152, i32 1
  store ptr %153, ptr %151, align 8
  store ptr %149, ptr %152, align 8
  %154 = load ptr, ptr %2, align 8
  %155 = getelementptr inbounds nuw %struct.IndirectVM, ptr %154, i32 0, i32 0
  %156 = load ptr, ptr %155, align 8
  %157 = load ptr, ptr %156, align 8
  %158 = load ptr, ptr %2, align 8
  %159 = getelementptr inbounds nuw %struct.IndirectVM, ptr %158, i32 0, i32 0
  store ptr %157, ptr %159, align 8
  %160 = load ptr, ptr %2, align 8
  %161 = getelementptr inbounds nuw %struct.IndirectVM, ptr %160, i32 0, i32 0
  %162 = load ptr, ptr %161, align 8
  %163 = load ptr, ptr %162, align 8
  %164 = getelementptr inbounds nuw %struct.IndirectOpcode, ptr %163, i32 0, i32 0
  %165 = load ptr, ptr %164, align 8
  br label %181

166:                                              ; preds = %181
  call void asm sideeffect ".globl forth_indirect_ret\0Aforth_indirect_ret:\0A", "X,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@indirect_run, %166)) #2, !srcloc !13
  %167 = load ptr, ptr %2, align 8
  %168 = getelementptr inbounds nuw %struct.IndirectVM, ptr %167, i32 0, i32 4
  %169 = load ptr, ptr %168, align 8
  %170 = getelementptr inbounds ptr, ptr %169, i32 -1
  store ptr %170, ptr %168, align 8
  %171 = load ptr, ptr %170, align 8
  %172 = load ptr, ptr %2, align 8
  %173 = getelementptr inbounds nuw %struct.IndirectVM, ptr %172, i32 0, i32 0
  store ptr %171, ptr %173, align 8
  %174 = load ptr, ptr %2, align 8
  %175 = getelementptr inbounds nuw %struct.IndirectVM, ptr %174, i32 0, i32 0
  %176 = load ptr, ptr %175, align 8
  %177 = load ptr, ptr %176, align 8
  %178 = getelementptr inbounds nuw %struct.IndirectOpcode, ptr %177, i32 0, i32 0
  %179 = load ptr, ptr %178, align 8
  br label %181

180:                                              ; preds = %181
  call void asm sideeffect ".globl forth_indirect_halt\0Aforth_indirect_halt:\0A", "X,~{dirflag},~{fpsr},~{flags}"(ptr blockaddress(@indirect_run, %180)) #2, !srcloc !14
  ret void

181:                                              ; preds = %166, %141, %127, %110, %85, %60, %35, %15, %1
  %182 = phi ptr [ %14, %1 ], [ %34, %15 ], [ %59, %35 ], [ %84, %60 ], [ %109, %85 ], [ %126, %110 ], [ %140, %127 ], [ %165, %141 ], [ %179, %166 ]
  indirectbr ptr %182, [label %15, label %35, label %60, label %85, label %110, label %127, label %141, label %166, label %180]
}

declare i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 20.1.8 (++20250804090239+87f0227cb601-1~exp1~20250804210352.139)"}
!6 = !{i64 2147713855, i64 2147714113}
!7 = !{i64 2147714407, i64 2147714663}
!8 = !{i64 2147714973, i64 2147715229}
!9 = !{i64 2147715539, i64 2147715795}
!10 = !{i64 2147716105, i64 2147716361}
!11 = !{i64 2147716648, i64 2147716908}
!12 = !{i64 2147717182, i64 2147717440}
!13 = !{i64 2147717667, i64 2147717923}
!14 = !{i64 2147718146, i64 2147718404}
