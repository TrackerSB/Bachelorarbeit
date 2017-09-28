; ModuleID = 'matmul.cpp'
source_filename = "matmul.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = local_unnamed_addr global [1000 x [1000 x i32]] zeroinitializer, align 16
@B = local_unnamed_addr global [1000 x [1000 x i32]] zeroinitializer, align 16
@C = local_unnamed_addr global [1000 x [1000 x i32]] zeroinitializer, align 16

; Function Attrs: norecurse nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.cond.cleanup3, %entry
  %indvars.iv101 = phi i64 [ 0, %entry ], [ %indvars.iv.next102, %for.cond.cleanup3 ]
  br label %for.body4

for.cond.cleanup3:                                ; preds = %for.body4
  %call = tail call i32 @rand() #2
  %rem = srem i32 %call, 1000
  %arrayidx13 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %indvars.iv101, i64 0
  %0 = load i32, i32* %arrayidx13, align 16, !tbaa !2
  %add = add nsw i32 %0, %rem
  store i32 %add, i32* %arrayidx13, align 16, !tbaa !2
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next102, 1000
  br i1 %exitcond103, label %for.body21.preheader, label %for.body

for.body21.preheader:                             ; preds = %for.cond.cleanup3
  br label %for.body21

for.body4:                                        ; preds = %for.body4, %for.body
  %indvars.iv97 = phi i64 [ 0, %for.body ], [ %indvars.iv.next98.3, %for.body4 ]
  %1 = mul nuw nsw i64 %indvars.iv97, %indvars.iv101
  %arrayidx6 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  %2 = trunc i64 %1 to i32
  store i32 %2, i32* %arrayidx6, align 16, !tbaa !2
  %arrayidx10 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %indvars.iv101, i64 %indvars.iv97
  store i32 %2, i32* %arrayidx10, align 16, !tbaa !2
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %3 = mul nuw nsw i64 %indvars.iv.next98, %indvars.iv101
  %arrayidx6.1 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  %4 = trunc i64 %3 to i32
  store i32 %4, i32* %arrayidx6.1, align 4, !tbaa !2
  %arrayidx10.1 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98
  store i32 %4, i32* %arrayidx10.1, align 4, !tbaa !2
  %indvars.iv.next98.1 = or i64 %indvars.iv97, 2
  %5 = mul nuw nsw i64 %indvars.iv.next98.1, %indvars.iv101
  %arrayidx6.2 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98.1
  %6 = trunc i64 %5 to i32
  store i32 %6, i32* %arrayidx6.2, align 8, !tbaa !2
  %arrayidx10.2 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98.1
  store i32 %6, i32* %arrayidx10.2, align 8, !tbaa !2
  %indvars.iv.next98.2 = or i64 %indvars.iv97, 3
  %7 = mul nuw nsw i64 %indvars.iv.next98.2, %indvars.iv101
  %arrayidx6.3 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98.2
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %arrayidx6.3, align 4, !tbaa !2
  %arrayidx10.3 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %indvars.iv101, i64 %indvars.iv.next98.2
  store i32 %8, i32* %arrayidx10.3, align 4, !tbaa !2
  %indvars.iv.next98.3 = add nsw i64 %indvars.iv97, 4
  %exitcond100.3 = icmp eq i64 %indvars.iv.next98.3, 1000
  br i1 %exitcond100.3, label %for.cond.cleanup3, label %for.body4

for.cond.cleanup20:                               ; preds = %for.cond.cleanup25
  ret i32 0

for.body21:                                       ; preds = %for.body21.preheader, %for.cond.cleanup25
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %for.cond.cleanup25 ], [ 0, %for.body21.preheader ]
  br label %for.body26

for.cond.cleanup25:                               ; preds = %for.cond.cleanup35
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next95, 1000
  br i1 %exitcond96, label %for.cond.cleanup20, label %for.body21

for.body26:                                       ; preds = %for.cond.cleanup35, %for.body21
  %indvars.iv91 = phi i64 [ 0, %for.body21 ], [ %indvars.iv.next92, %for.cond.cleanup35 ]
  %call27 = tail call i32 @rand() #2
  %rem28 = srem i32 %call27, 1000
  %arrayidx32 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @C, i64 0, i64 %indvars.iv94, i64 %indvars.iv91
  store i32 %rem28, i32* %arrayidx32, align 4, !tbaa !2
  br label %for.body36

for.cond.cleanup35:                               ; preds = %for.body36
  store i32 %add50.1, i32* %arrayidx32, align 4, !tbaa !2
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next92, 1000
  br i1 %exitcond93, label %for.cond.cleanup25, label %for.body26

for.body36:                                       ; preds = %for.body36, %for.body26
  %indvars.iv = phi i64 [ 0, %for.body26 ], [ %indvars.iv.next.1, %for.body36 ]
  %add5086 = phi i32 [ %rem28, %for.body26 ], [ %add50.1, %for.body36 ]
  %arrayidx40 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %indvars.iv94, i64 %indvars.iv
  %9 = load i32, i32* %arrayidx40, align 8, !tbaa !2
  %arrayidx44 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv91
  %10 = load i32, i32* %arrayidx44, align 4, !tbaa !2
  %mul45 = mul nsw i32 %10, %9
  %add50 = add nsw i32 %add5086, %mul45
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx40.1 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %indvars.iv94, i64 %indvars.iv.next
  %11 = load i32, i32* %arrayidx40.1, align 4, !tbaa !2
  %arrayidx44.1 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i64 0, i64 %indvars.iv.next, i64 %indvars.iv91
  %12 = load i32, i32* %arrayidx44.1, align 4, !tbaa !2
  %mul45.1 = mul nsw i32 %12, %11
  %add50.1 = add nsw i32 %add50, %mul45.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %for.cond.cleanup35, label %for.body36
}

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #1

attributes #0 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0 (https://github.com/PolyJIT/clang.git 89be37b467850bf7c86dfe227352f09721092385) (https://github.com/PolyJIT/llvm.git 04facbb8fb0b324cd65b0712c8884fbf1287384c)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
