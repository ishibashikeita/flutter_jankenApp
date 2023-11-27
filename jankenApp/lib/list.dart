List<String> choose = [
  'images/rock.png',
  'images/scissors.png',
  'images/paper.png'
];
List<String> cchoose = [
  'images/rock_cpu.png',
  'images/scissors_cpu.png',
  'images/paper_cpu.png'
];

class ResultContents {
  Map getContent(int id) {
    return result[id];
  }

  List result = <Map<String, String>>[
    {'引き分け！おもんないなあ！': 'draw'},
    {'あなたの勝ちです！やったね！': 'win'},
    {'あなたの負け！もう一回！': 'lose'}
  ];
}
