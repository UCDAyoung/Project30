# Project30
----
[프로젝트 링크](https://github.com/soapyigu/Swift-30-Projects)
![Swift30Projects](https://user-images.githubusercontent.com/70427427/130021929-ed61c154-ef63-4d23-8342-28c1b2eb844a.png)
----


진행하면서 생긴 의문점 및 정리 

1. [FacebookMe](#facebookme)
2. [GoodAsOldPhones](#goodasoldphones)
3. [kingFisher](#kingfisher)
4. [LED](#led)
5. [textFieldPrac](#textfieldprac)
6. [Calculator](#calculator)
7. [CoreData](#coredata)

### 애플 네이밍 규칙에 의미를 이해하고 추리하자 <br> 
did ~~  / will~~  / can ~~ ... etc <br>
다 의미가 있는 메소드 네이밍들이기 때문에, 이런 점들을 유의해서 메소드를 바라볼 줄 아는 시선을 갖는다면, 메소드를 유추해서 찾아서 사용할 수 있을 것 같다. <br>
e.g. didEditing() 이라고 하면 Editing ~~하고나서~~ 실행되는 메소드이거나, can이 붙으면 canEditing() Editing을 ~~할 수 있을 때~~ 실행되는 메소드를 의미한다. <br>

### class와 struct의 차이 
일단 대표적으로, class는 참조, struct는 값타입이다.<br>
class는 원본까지 직접 접근하여 값을 변경할 수 있다. 이에 반하여  stuct는 값타입이기 때문에, 복사를 통해서 사용하고 값을 변경할거면 따로 어떤 조치를 취해줘야한다. <br>
Excel 과 SpreadSheet in Google 로 예를 들어보겠다.<br>
친구와 같이 개발문서를 1)Excel 2)SpreadSheet 로 정리했다고 하자. <br> 

*1) Excel 사용*<br>  
동시에 친구랑 나랑 정리를 하고 있는데, Excel인 경우에는 저장버튼을 눌러서 나한테 메일을 보내는 등의 추가적인 조치를 취해야지 동기화가 이루어진다. <br>
*2) SpreadSheet 사용*<br>
구글스프레드시트인 경우, 친구가 수정하는 즉시 바로 변경됨을 확인할 수 있다.<br>
<br>
이 경우를 App으로 가져와서 본다면, 어떠한 화면에서 시트를 작성할 때 바로바로 동기화를 해줘야 할 것이 있다면, 반대로, 작성 버튼이나 확인버튼 같은 추가조치를 할 때 동기화가 필요한 경우이다. <br>
가능하면 struct를 이용하면 되고, class를 이용해야하는 경우 (메모리를 올려놓은 상태에서 바로바로 동기화를 시켜야하는 경우)만 사용해주면 된다고 한다. <br> 

### 언제 viewDidLoad()에 넣어서 사용하는걸까? 
뷰가 로드됬을 때, 변경될 사항도 많지 않고, 가져다 쓰기만하며 될 기본적인 것들? <br>
만약 계속해서 써야하는 것들을 계속 로드시킨다면 불필요한 작업일 것이다. 

### MVC <-> MVVM
MVC (Model View Controller) <br>
뷰컨트롤러에서 뷰와 모델을 둘 다 관리할 수 있다. 그 만큼, 스케일이 큰 앱은 뷰컨트롤러가 너무 무거워진다. <br>
개선 : 어떻게 최대한 작게 만들 수 있을까? <br>
- 뷰 로직 / 비즈니스 로직을 분리한다 
- MVVM
- MVP
- VIPER
- clean Swift <br>
MVVM (Model View ViewModel) <br> 
아직 크게 와닿지 않음. <br>

### 아키텍쳐 패턴
멘토님의 파일 아키텍쳐를 보았는데, 나와 다르게 분류가 잘 되어있었다고 느껴졌다. <br>
"어떻게하면 구조적으로 구성할 수 있을지?"에 대한 의문을 가졌고, 이 공부는 계속해가면서 아키텍쳐 패턴(MVC,MVVM..)을 공부해서 해답을 찾을 수 있을 것 같다. 

### 오토레이아웃
x,y, width, height 모두 잡아야지 옳바르게 constraint를 한 것이다.<br>

### private func 

### only for code 

### about DataStucture using MVC 

# FacebookMe

![FacebookMe](https://user-images.githubusercontent.com/70427427/140731033-06d2c981-09f8-48a9-8e1e-79ad2922da6e.gif)

- tableViewDelegate, tableViewdataSource 사용 
- 첫 과제부터 MVC,MVVM 두 모델로 만들어 볼려고 했더니, 꽤 힘들었지만 힘든만큼 디자인패턴에 대한 이해도가 올라감  
- MVC : VC가 뷰와 모델 모두를 컨트롤 함. 그러다 보니, 장점은 모든걸 VC에서 처리하기 때문에 사용하기는 편하지만, VC가 비대해짐 
- MVVM : View > ViewModel -> Model . VM이 모델을 관리하고 View가 VM을 구독하는 형태 
- 코드와 스토리보드 둘 다 사용해봄. 둘 다 섞어서 사용하는게 편함.

# GoodAsOldPhones

![GoodAsOldPhones](https://user-images.githubusercontent.com/70427427/140731039-f7c19927-446a-4993-ba3e-088d9106620d.gif)
- 데이터를 하드코딩하지 않고, 직접 참조할 수 있게 struct구조로 만들어서 데이터를 참조해서 데이터를 전달함. 
- prepare, performSegue를 이용해서 데이터를 전달
- UI구성에 가장 시간을 많이 사용함 'Cause font, image가 뷰 크기에 따라 잘리고 밀리는 현상
- Scale to fil vs Aspect to fil vs Aspect to fit
- Compression Priority vs Hugging Priority 
<img width="372" alt="스크린샷 2021-11-08 오후 8 15 25" src="https://user-images.githubusercontent.com/70427427/140732633-b4fe15e7-38f0-457d-90b5-17b39c8f184d.png">


# kingFisher

![kingFisher](https://user-images.githubusercontent.com/70427427/140731048-bfd96885-f03a-4a6b-a995-cb5ed7d3f6d4.gif)

- 라이브러리 사용 숙지 (E.g KingFisher) 
- Swift Package Manager 이용해서 load 


# LED

![LED](https://user-images.githubusercontent.com/70427427/140731056-5f2604d1-6119-4cb5-96e8-754b639ad0ab.gif)

- 색을 선택하는 뷰에서 -> 메인 뷰로 선택한 컬러를 전달하는 데이터 전달에 집중  

# textFieldPrac

![textFieldPrac](https://user-images.githubusercontent.com/70427427/140731065-4dbcc62e-05c9-45ca-b87e-99937e31788d.gif)

- textField 문서를 뜯어보았다. 직접 뜯어보고 모든 function을 실행시켜보면서 이해를 해봄 
- Documentaion을 최대한 이용하려고 하는 중..

# Calculator

![Calculator](https://user-images.githubusercontent.com/70427427/140731071-39d20ff4-96a8-4997-8a3a-b216a8536559.gif)

- UI를 구성하는게 굉장히 까다로웠음. 
- StackView를 활용하고, 비율을 이용해서 크기와 모양을 잡아야 함.

# CoreData
![CoreData](https://user-images.githubusercontent.com/70427427/140731084-f44ddaae-c4a7-434b-b09f-11f10b9d54e1.gif)

- Coredata 흐름 이해 
- [공식문서](https://developer.apple.com/documentation/coredata)
- [참고영상](https://www.youtube.com/watch?v=M-3oFO7P1gQ)



