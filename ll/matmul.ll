; ModuleID = 'matmul.cpp'
source_filename = "matmul.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@A = global [1000 x [1000 x i32]] zeroinitializer, align 16
@B = global [1000 x [1000 x i32]] zeroinitializer, align 16
@C = global [1000 x [1000 x i32]] zeroinitializer, align 16

; Function Attrs: noinline norecurse nounwind optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  %r16 = alloca i32, align 4
  %c20 = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %r, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i32, i32* %r, align 4
  %cmp = icmp slt i32 %0, 1000
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %c, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %c, align 4
  %cmp2 = icmp slt i32 %1, 1000
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %r, align 4
  %3 = load i32, i32* %c, align 4
  %mul = mul nsw i32 %2, %3
  %4 = load i32, i32* %r, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i64 0, i64 %idxprom
  %5 = load i32, i32* %c, align 4
  %idxprom4 = sext i32 %5 to i64
  %arrayidx5 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx, i64 0, i64 %idxprom4
  store i32 %mul, i32* %arrayidx5, align 4
  %6 = load i32, i32* %r, align 4
  %idxprom6 = sext i32 %6 to i64
  %arrayidx7 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %idxprom6
  %7 = load i32, i32* %c, align 4
  %idxprom8 = sext i32 %7 to i64
  %arrayidx9 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx7, i64 0, i64 %idxprom8
  store i32 %mul, i32* %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %8 = load i32, i32* %c, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %c, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %call = call i32 @rand() #2
  %rem = srem i32 %call, 1000
  %9 = load i32, i32* %r, align 4
  %idxprom10 = sext i32 %9 to i64
  %arrayidx11 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %idxprom10
  %arrayidx12 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx11, i64 0, i64 0
  %10 = load i32, i32* %arrayidx12, align 16
  %add = add nsw i32 %10, %rem
  store i32 %add, i32* %arrayidx12, align 16
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %11 = load i32, i32* %r, align 4
  %inc14 = add nsw i32 %11, 1
  store i32 %inc14, i32* %r, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  store i32 0, i32* %r16, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc53, %for.end15
  %12 = load i32, i32* %r16, align 4
  %cmp18 = icmp slt i32 %12, 1000
  br i1 %cmp18, label %for.body19, label %for.end55

for.body19:                                       ; preds = %for.cond17
  store i32 0, i32* %c20, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc50, %for.body19
  %13 = load i32, i32* %c20, align 4
  %cmp22 = icmp slt i32 %13, 1000
  br i1 %cmp22, label %for.body23, label %for.end52

for.body23:                                       ; preds = %for.cond21
  %call24 = call i32 @rand() #2
  %rem25 = srem i32 %call24, 1000
  %14 = load i32, i32* %r16, align 4
  %idxprom26 = sext i32 %14 to i64
  %arrayidx27 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @C, i64 0, i64 %idxprom26
  %15 = load i32, i32* %c20, align 4
  %idxprom28 = sext i32 %15 to i64
  %arrayidx29 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx27, i64 0, i64 %idxprom28
  store i32 %rem25, i32* %arrayidx29, align 4
  store i32 0, i32* %t, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc47, %for.body23
  %16 = load i32, i32* %t, align 4
  %cmp31 = icmp slt i32 %16, 1000
  br i1 %cmp31, label %for.body32, label %for.end49

for.body32:                                       ; preds = %for.cond30
  %17 = load i32, i32* %r16, align 4
  %idxprom33 = sext i32 %17 to i64
  %arrayidx34 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @A, i64 0, i64 %idxprom33
  %18 = load i32, i32* %t, align 4
  %idxprom35 = sext i32 %18 to i64
  %arrayidx36 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx34, i64 0, i64 %idxprom35
  %19 = load i32, i32* %arrayidx36, align 4
  %20 = load i32, i32* %t, align 4
  %idxprom37 = sext i32 %20 to i64
  %arrayidx38 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @B, i64 0, i64 %idxprom37
  %21 = load i32, i32* %c20, align 4
  %idxprom39 = sext i32 %21 to i64
  %arrayidx40 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx38, i64 0, i64 %idxprom39
  %22 = load i32, i32* %arrayidx40, align 4
  %mul41 = mul nsw i32 %19, %22
  %23 = load i32, i32* %r16, align 4
  %idxprom42 = sext i32 %23 to i64
  %arrayidx43 = getelementptr inbounds [1000 x [1000 x i32]], [1000 x [1000 x i32]]* @C, i64 0, i64 %idxprom42
  %24 = load i32, i32* %c20, align 4
  %idxprom44 = sext i32 %24 to i64
  %arrayidx45 = getelementptr inbounds [1000 x i32], [1000 x i32]* %arrayidx43, i64 0, i64 %idxprom44
  %25 = load i32, i32* %arrayidx45, align 4
  %add46 = add nsw i32 %25, %mul41
  store i32 %add46, i32* %arrayidx45, align 4
  br label %for.inc47

for.inc47:                                        ; preds = %for.body32
  %26 = load i32, i32* %t, align 4
  %inc48 = add nsw i32 %26, 1
  store i32 %inc48, i32* %t, align 4
  br label %for.cond30

for.end49:                                        ; preds = %for.cond30
  br label %for.inc50

for.inc50:                                        ; preds = %for.end49
  %27 = load i32, i32* %c20, align 4
  %inc51 = add nsw i32 %27, 1
  store i32 %inc51, i32* %c20, align 4
  br label %for.cond21

for.end52:                                        ; preds = %for.cond21
  br label %for.inc53

for.inc53:                                        ; preds = %for.end52
  %28 = load i32, i32* %r16, align 4
  %inc54 = add nsw i32 %28, 1
  store i32 %inc54, i32* %r16, align 4
  br label %for.cond17

for.end55:                                        ; preds = %for.cond17
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #1

attributes #0 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0 (https://github.com/PolyJIT/clang.git 89be37b467850bf7c86dfe227352f09721092385) (https://github.com/PolyJIT/llvm.git 04facbb8fb0b324cd65b0712c8884fbf1287384c)"}
