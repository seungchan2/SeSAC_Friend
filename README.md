# SeSAC_Friends

## 개발 전 지킬 약속
### 모든 뷰 Code-base
### 반복되는 코드 줄이기
- Button, TextField, bottomView의 색이 계속 바뀌는데 이 부분은 하나의 프로토콜로 만들어서 사용
### 재사용
- 카드뷰에서 사용되는 뷰가 다른 뷰에서 재사용되는데 이 부분을 Common/View 로 만들어 재사용
- CustomTabbar의 재사용 -> PagerTab

2월 3일 (목)
- Shop UI 구현

2월 4일 (금)
- Button, TextField 하나의 프로토콜로 만듦
- 회원가입 UI를 Xib에서 Code로 수정 예정 
- Auth부분을 MVC에서 MVVM으로 가져갈 예정

2월 5일 (토)
- 데이트 피커 날짜가 yyyy-MM-dd 형식으로 저장되는데 문자열 index를 나눠서 라벨에 표시
- 서버 통신 할 때는 2024-04-06 01:14:23 +0000 요 형식이라서 변수를 만들고 저장
- 타이머 DispatchTimer로 구현
- 한글, 핸드폰 정규식 추가

개발 이슈
- 카드뷰 재사용되는 부분 클릭이 안 되는 것 같음 
- 로그를 안 찍어봤는데 아마 View 계층 문제인 듯 주말에 리팩토링 예정
- 카드뷰가 펼쳐지는 부분에서 TableView Self-Sizing이 되어야 하는데 후순위로 밀어두고 작업

2월 5일, 6일 해야 할 일
- [ ] Firebase / AppleConnect 연결 (Firebase 연결 완료) -> Apple은 토요일
- [x] 회원가입 UI 재구현 -> 금요일
- [x] 회원가입 로직 구현 -> 토요일
- [ ] 회원가입 서버 통신 -> 일요일
- [x] MVVM 공부
- [ ] 위에 모든 걸 끝낸다면 Home UI구현 예정

멘토님에게 질문사항
- 카드뷰를 TableView로 만들고 4개의 Cell로 나눴는데 재사용 할 때 ~view.tableView.~view로 들어가게 되는데 괜찮은지? -> ok
- UI를 모두 짜고 서버통신을 해도 되는지? -> 실무에 가면 UI가 지금처럼 다 나온 상태가 아니기 때문에 미리 해야 한다.
