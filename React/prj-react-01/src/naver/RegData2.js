// ----------------------------------------------------------------
// 프로젝트명 /node_modules/react 안에 default 가 붙어 수출하는 놈을 수입해서
// 현재 파일 안에서 React 란 이름으로 사용한다.
// 프로젝트명 /node_modules/react 안에 default 가 안붙어 수출하는 놈 Component 를 수입해서
// 현재 파일 안에서 Component 란 이름으로 사용할 것이다.
// ----------------------------------------------------------------
// <참고> 아래 수입 코드는 클래스 컴포넌트가 선언되는 js 파일안에서는 필수로 수입되는 것들이다.
import React, { Component } from "react";
// ----------------------------------------------------------------
// 리액트의 단위 프로그램중 하나인 [클래스 컴포넌트] 선언하기
// <참고> [클래스 컴포넌트]는 자바의 클래스와 유사한 행태를 가지고 있다.
// <참고> [클래스 컴포넌트]는 반드시 Component 클래스를 상속해야 한다.
// ----------------------------------------------------------------
class RegData2 extends Component {

    // ----------------------------------------------------------------
    // 속성변수 nameRef 선언하고
    // React 객체의 createRef() 메소드를 호출하여 리턴된 데이터를 저장하기
    // 이후부터 ref={this.nameRef} 가진 태그는
    // this.nameRef.current.focus(); 코딩이 실행되면
    // 포커스가 그 태그안으로 들어간다.
    // ----------------------------------------------------------------
    nameRef = React.createRef();

    // ----------------------------------------------------------------
    // 속성변수 names 선언하고 Array 객체 저장하기
    // ----------------------------------------------------------------
    names= [
        {id:1,text:'사오정'}
        ,{id:2,text:'저팔계'}
        ,{id:3,text:'손오공'}
        ,{id:4,text:'삼장법사'}
    ];
    // ----------------------------------------------------------------
    // 리액트가 제공하는 state 속성변수 선언하고 [사용자정의 객체] 저장하기
    // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        // 클래스 컴포넌트 안에서 리액트가 제공하는 state 속성변수 특징
        // ----------------------------------------------------------------
            // state 속성변수의 갱신은 리액트가 제공하는 setState 메소드 호출로만 가능하다.
            // setState 메소드 호출로 state 속성변수 안의 값이 갱신 되면 render 메소드가 재 호출된다.
            // state 속성변수 호출할 경우 this. 붙인다.
        // ----------------------------------------------------------------
    state = {
        names:this.names            // 이름 목록 저장
        ,inputText:""               // 입력 데이터 저장
        ,nextId:this.names.length+1 // 추가 저장될 데이터의 고유값
    };
    
    // ----------------------------------------------------------------
    // 화살표 함수가 저장된 속성변수 textChange 선언.
    // 아래 매개변수 e 에는 Event 객체가 들어온다.
    // 즉 아래 화살표함수는 입력양식에 이벤트가 발생했을 때 실행할 구문을 내포하고 있다.
    // ----------------------------------------------------------------
    textChange = (e) => {
    /*
        // ----------------------------------------------------------------
        // 지역변수 inputText에 이벤트가 발생한 놈의 value 값을 저장하기
        // 앞뒤 공백 제거하고 재 저장하기
        // ----------------------------------------------------------------
        let val = e.target.value;
        val = val.trim();
       
        // ----------------------------------------------------------------
        // setState 라는 메소드 호출하여
        // state 변수 안의 저장된 사용자정의 객체 안의 속성변수 inputText 안의 데이터를
        // val 안의 데이터로 갱신하라
        // ----------------------------------------------------------------
        // <주의> state 변수 안의 저장된 사용자정의 객체가
        //        {inputText:val} 로 완전 갱신 된게 절대 아니다.
        //        즉 부분 갱신만 진행된 것이다.
        // ----------------------------------------------------------------
        this.setState({InputText:val});
    }
    */
        this.setState(
            {inputText:e.target.value}
        );
    }
    // ----------------------------------------------------------------
    // 화살표 함수가 저장된 지역변수 add 선언.
    // 화살표함수 안에는 추가 버튼 클릭시 호출되는 실행 구문을 내포하고 있다.
    // ----------------------------------------------------------------
    add = () => {
        // ----------------------------------------------------------------
        // 지역변수 선언하고 state 속성변수 안의 사용자정의 객체 안의 데이터를 지역변수에 저장하기
        // <주의> 지역변수에 inputText는 공백 제거 예정이므로 변수 왼쪽에 const를 사용하지 않는다.
        // ----------------------------------------------------------------
        let inputText = this.state.inputText;
        const nextId = this.state.nextId;
        const names = this.state.names;
        // ----------------------------------------------------------------
        // 만약 입력한 데이터가 비어있으면 경고하고 함수 중단.
        // ----------------------------------------------------------------
        if(inputText==null || inputText==undefined || inputText.split(" ").join("")=="") {
            alert ("데이터가 비어있어 입력 불가능");
            this.setState({InputText:''});
            return;
        }
        inputText = inputText.trim();
        // ----------------------------------------------------------------
        // 만약 중복되어 있으면 경고하고 함수 중단
        // ----------------------------------------------------------------
        if (names!=null) {
            const tmpNames = names.filter(name=>name.text===inputText);
            if (tmpNames.length>0) {
                alert (inputText+"문자 이미 있어서 입력 불가능");
                this.setState({InputText:''});
                return;
            }
        }
        // ----------------------------------------------------------------
        // 지역변수 newNames 선언하고
        // names 안의 Array 객체 복사하고 {id: nextId, text: inputText} 추가하고
        // 이렇게 만들어 새로운 Array 객체를 newNames에 저장하기
        // ----------------------------------------------------------------
        const newNames = names.concat({
            id: nextId,         // nextId 값을 id로 설정하고
            text: inputText
        });
        // ----------------------------------------------------------------
        // newNames 안의 Array 객체를 기존 names 안에 갱신해서 저장하기
        // ----------------------------------------------------------------
        this.setState({names:newNames});
        // ----------------------------------------------------------------
        // nextId 사용자정의 객체안의 nextId 속성변수에 nextId+1 의 실행결과 저장하기.
        // 즉 기본 데이터에서 1 증가하란 의미
        // ----------------------------------------------------------------
        this.setState({nextId:nextId+1});
        // ----------------------------------------------------------------
        // inputText 지역변수에 "" 저장하기
        // 즉 결국 입력 양식이 비어지게 된다.
        // ----------------------------------------------------------------
        this.setState({InputText:''});
    }
    // ----------------------------------------------------------------
    // 화살표 함수가 저장된 지역변수 remove 선언
    // 화살표 함수 안에는 목록을 더블클릭하면 목록을 삭제하는 구문이 내포되어있다.
    // 매개변수 더블클릭하는 목록의 고유값인 id 값이 들어 온다.
    // ----------------------------------------------------------------
    remove = (id) => {
        const names = this.state.names;
        // ----------------------------------------------------------------
        // 지역변수 nextNames 선언하고
        // Array 객체의 filter 메소드를 호출하여
        // names에 저장된 사용자정의 객체를 1개씩 꺼내서
        // 아래의 화살표 함수를 호출하여 리턴되는 데이터가 true 일때만
        // 사용자정의 객체만 복사해 누적하기
        // 즉 매개변수로 들어온 id와 같지않은 놈만 골라서 누적하기
        // ----------------------------------------------------------------
        const nextNames = names.filter(name=>name.text.id !==id);
        // ----------------------------------------------------------------
        // names 지역변수에 nextNames 안의 Array 객체로 갱신하기
        // 즉 기존 데이터에서  1 증가하란 의미
        // ----------------------------------------------------------------
        this.setState({names:nextNames});
    };
    // ----------------------------------------------------------------
    // render 메소드 필수 1개 선언
    // ----------------------------------------------------------------
    render() {
        const namesTag = this.state.names.map(
            name =>
                <li style={{cursor:'pointer'}} key={name.id} onDoubleClick={()=>this.remove(name.id)}>
                    {name.text}
                </li>
        );
        // ----------------------------------------------------------------
        // JSX 문법을 가진 return 구문 선언
        // 리턴되는 JSX 문법이 결국 웹화면에 출력된다.
        // ----------------------------------------------------------------
        return(
            <>
                <center>
                    {this.state.inputText}
                    <table><tr><td>
                    <input
                         type='text'
                         value={this.state.inputText}
                         onChange={this.textChange}/>&nbsp;
                    <button onClick={this.add}>추가</button>
                    <ul>{namesTag}</ul>
                    </td></tr></table>
                </center>
            </>
        )
    }
}
export default RegData2;