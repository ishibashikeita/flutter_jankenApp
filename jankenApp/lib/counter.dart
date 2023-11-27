int winn = 0;
int lose = 0;
int draw = 0;

class counter {
  void winner() {
    winn++;
  }

  void loser() {
    lose++;
  }

  void drawer() {
    draw++;
  }

  getWin() {
    return winn.toString();
  }

  getLose() {
    return lose.toString();
  }

  getDraw() {
    return draw.toString();
  }
}
