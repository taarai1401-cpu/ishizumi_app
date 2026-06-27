
class Question {
  final String text;
  final bool isCorrect;
  final String comment;

  Question({required this.text, required this.isCorrect, required this.comment});
}

final List<Question> stoneQuestions = [
  Question(
    text: '石を横に寝かせず、縦長に立てて積む「たて石」は、石積みにおいて正しい積み方である。',
    isCorrect: false,
    comment: '×：たて石は「禁じ手」です！石は横に寝かせて積むのが基本です。',
  ),
  Question(
    text: '上下の石の縦目地が十字に交差してしまう「十文字」は、構造が弱くなるため【禁じ手】である。',
    isCorrect: true,
    comment: '〇：その通り！目地は T字 になるようにずらすのが基本です。',
  ),
  Question(
    text: '横の目地がずーっと一直線に通ってしまう通し目地のことを「真一文字」と呼び、これも【禁じ手】である。',
    isCorrect: true,
    comment: '〇：その通り！一本の線から滑り出して崩れる原因になります。',
  ),
  Question(
    text: '1つの石の周りを4つの石で囲んでしまう積み方を「四つ巻」と呼び、構造が弱くなるため【禁じ手】である。',
    isCorrect: true,
    comment: '〇：その通り！中心の石が押し出されやすくなってしまいます。',
  ),
  Question(
    text: '石と石の間の目地が、斜めに一直線に長く通ってしまう状態を「目通り」と呼び、これも【禁じ手】である。',
    isCorrect: true,
    comment: '〇：その通り！滑り台のようになって石が滑り落ちる原因になります。',
  ),
  Question(
    text: '石積みをしたときに、一番表側に見える、整えられた表面のことを「顔」と呼ぶ。',
    isCorrect: true,
    comment: '〇：その通り！見える部分を「顔」や「面（つら）」と呼びます。',
  ),
  Question(
    text: '石の「顔」の反対側、壁の奥深くに隠れる後ろ側の部分のことを「尻」と呼ぶ。',
    isCorrect: true,
    comment: '〇：その通り！「尻」をしっかり噛み合わせることが安定の秘訣です。',
  ),
  Question(
    text: '石積みにおいて、石の奥行きの長さのことを「控え」と呼び、壁の強度に重要である。',
    isCorrect: true,
    comment: '〇：その通り！「控え」は石積みの命。顔の2〜3倍の長さが必要です。',
  ),
  Question(
    text: '石を積むとき、石の「顔（表面）」の面積よりも、「控え（奥行き）」のほうが長くなくてはならない。',
    isCorrect: true,
    comment: '〇：その通り！顔が小さく控えが長い石が良い石とされています。',
  ),
  Question(
    text: '積んだ石の「尻」の隙間に詰め込んで固定する小さな石のことを「ぐり石」と呼ぶ。',
    isCorrect: true,
    comment: '〇：その通り！見えない部分ですが、ぐり石を詰めることで石が動きません。',
  ),
];