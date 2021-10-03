import UIKit




// 클로저는 함수 안에서 한 번만 할 행동을 제시해주는 함수?

func hi1( hi :@escaping ()->(),parameter : Int){
    print("hi1"+"\(parameter)")
    hi()
    print("hi2")
}
//실행할 때 활동을 정의하는 함수같음
hi1(hi: {
    print("안녕하세요")
}, parameter: 5)


