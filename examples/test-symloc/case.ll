; ModuleID = 'case.bc'
source_filename = "case.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"1st path\0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"2nd path\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @f() #0 !dbg !9 {
entry:
  %p = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %p, metadata !12, metadata !DIExpression()), !dbg !15
  %call = call noalias align 16 i8* @malloc(i64 100) #4, !dbg !16
  store i8* %call, i8** %p, align 8, !dbg !15
  %0 = load i8*, i8** %p, align 8, !dbg !17
  %cmp = icmp ugt i8* %0, inttoptr (i64 100 to i8*), !dbg !19
  br i1 %cmp, label %if.then, label %if.else, !dbg !20

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !21
  br label %if.end, !dbg !23

if.else:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0)), !dbg !24
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32 @printf(i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @f(), !dbg !36
  ret i32 0, !dbg !37
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "case.c", directory: "/home/haoxin/research/klee-se/SymLoc/examples/test-symloc")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.1"}
!9 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 5, type: !10, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null}
!12 = !DILocalVariable(name: "p", scope: !9, file: !1, line: 6, type: !13)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DILocation(line: 6, column: 12, scope: !9)
!16 = !DILocation(line: 6, column: 16, scope: !9)
!17 = !DILocation(line: 14, column: 9, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !1, line: 14, column: 9)
!19 = !DILocation(line: 14, column: 11, scope: !18)
!20 = !DILocation(line: 14, column: 9, scope: !9)
!21 = !DILocation(line: 15, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !1, line: 14, column: 17)
!23 = !DILocation(line: 17, column: 5, scope: !22)
!24 = !DILocation(line: 19, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !1, line: 18, column: 8)
!26 = !DILocation(line: 23, column: 1, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 25, type: !28, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!30, !30, !31}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!32 = !DILocalVariable(name: "argc", arg: 1, scope: !27, file: !1, line: 25, type: !30)
!33 = !DILocation(line: 25, column: 14, scope: !27)
!34 = !DILocalVariable(name: "argv", arg: 2, scope: !27, file: !1, line: 25, type: !31)
!35 = !DILocation(line: 25, column: 27, scope: !27)
!36 = !DILocation(line: 44, column: 5, scope: !27)
!37 = !DILocation(line: 45, column: 5, scope: !27)
