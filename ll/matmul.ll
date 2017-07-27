; ModuleID = 'matmul.cpp'
source_filename = "matmul.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind uwtable
define i32 @main(i32, i8** nocapture readnone) local_unnamed_addr #0 {
  %3 = alloca [1000 x [1000 x i32]], align 16
  %4 = bitcast [1000 x [1000 x i32]]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4000000, i8* nonnull %4) #3
  br label %5

; <label>:5:                                      ; preds = %7, %2
  %6 = phi i64 [ 0, %2 ], [ %13, %7 ]
  br label %15

; <label>:7:                                      ; preds = %15
  %8 = tail call i32 @rand() #3
  %9 = srem i32 %8, 1000
  %10 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* %3, i64 0, i64 %6, i64 0
  %11 = load i32, i32* %10, align 16, !tbaa !2
  %12 = add nsw i32 %11, %9
  store i32 %12, i32* %10, align 16, !tbaa !2
  %13 = add nuw nsw i64 %6, 1
  %14 = icmp eq i64 %13, 1000
  br i1 %14, label %38, label %5

; <label>:15:                                     ; preds = %15, %5
  %16 = phi i64 [ 0, %5 ], [ %36, %15 ]
  %17 = mul nuw nsw i64 %16, %6
  %18 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* %3, i64 0, i64 %6, i64 %16
  %19 = trunc i64 %17 to i32
  store i32 %19, i32* %18, align 4, !tbaa !2
  %20 = add nuw nsw i64 %16, 1
  %21 = mul nuw nsw i64 %20, %6
  %22 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* %3, i64 0, i64 %6, i64 %20
  %23 = trunc i64 %21 to i32
  store i32 %23, i32* %22, align 4, !tbaa !2
  %24 = add nsw i64 %16, 2
  %25 = mul nuw nsw i64 %24, %6
  %26 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* %3, i64 0, i64 %6, i64 %24
  %27 = trunc i64 %25 to i32
  store i32 %27, i32* %26, align 4, !tbaa !2
  %28 = add nsw i64 %16, 3
  %29 = mul nuw nsw i64 %28, %6
  %30 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* %3, i64 0, i64 %6, i64 %28
  %31 = trunc i64 %29 to i32
  store i32 %31, i32* %30, align 4, !tbaa !2
  %32 = add nsw i64 %16, 4
  %33 = mul nuw nsw i64 %32, %6
  %34 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* %3, i64 0, i64 %6, i64 %32
  %35 = trunc i64 %33 to i32
  store i32 %35, i32* %34, align 4, !tbaa !2
  %36 = add nsw i64 %16, 5
  %37 = icmp eq i64 %36, 1000
  br i1 %37, label %7, label %15

; <label>:38:                                     ; preds = %7, %41
  %39 = phi i32 [ %42, %41 ], [ 0, %7 ]
  br label %44

; <label>:40:                                     ; preds = %41
  call void @llvm.lifetime.end.p0i8(i64 4000000, i8* nonnull %4) #3
  ret i32 0

; <label>:41:                                     ; preds = %44
  %42 = add nuw nsw i32 %39, 1
  %43 = icmp eq i32 %42, 1000
  br i1 %43, label %40, label %38

; <label>:44:                                     ; preds = %44, %38
  %45 = phi i32 [ 0, %38 ], [ %47, %44 ]
  %46 = tail call i32 @rand() #3
  %47 = add nuw nsw i32 %45, 1
  %48 = icmp eq i32 %47, 1000
  br i1 %48, label %41, label %44
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #2

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 5.0.0 (https://github.com/PolyJIT/clang.git 5562594fbaa89ef0a8ec16eb79f7f5df36bce299) (https://github.com/PolyJIT/llvm.git e173c46c4977ab6025536113950f422993e019f0)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
