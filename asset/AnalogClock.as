class AnalogClock extends Date { // Dateクラスを継承するアナログ時計クラス

    private var rotation_h:Number; // 変数設定、時針の角度（型；数値）
    private var rotation_m:Number; // 変数設定、分針の角度（型：数値）
    private var rotation_s:Number; // 変数設定、秒針の角度（型：数値）

    public function AnalogClock() { // コンストラクタ
        var hours:Number = this.getHours(); // 変数設定、時間取得（型：数値）、範囲0～23
        var minutes:Number = this.getMinutes(); // 変数設定、分取得（型：数値）
        var seconds:Number = this.getSeconds(); // 変数設定、秒取得（型：数値）
        if (hours > 12) { // 13以上の場合、
            hours = hours - 12; // 12を引く（24時間表記にしない＝角度算出のため）
        }
        if (hours < 1) { // 1より小さい場合12、hour == 12でも良い
            hours = 12; // 時間0
        }
        rotation_h = hours * 30 + Math.floor(minutes / 2); // 時針の角度算出（360/12＝30、取得した時間に30度かける+分の進み具合0から60の分量）
        rotation_m = minutes * 6 + Math.floor(seconds / 10); // 分針の角度算出（360/60＝6、取得した分に6度かける+秒の進み具合0～60の分量）
        rotation_s = seconds * 6; // 秒針の角度算出（360/6＝6、取得した秒に6度掛ける）
    }

    public function get_rts():Number { // 秒針を返す
        return rotation_s;
    }

    public function get_rtm():Number { // 分針を返す
        return rotation_m;
    }

    public function get_rth():Number { // 時針を返す
        return rotation_h;
    }

}