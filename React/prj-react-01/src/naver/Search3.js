/*
// ----------------------------------------------------------------
// 프로젝트명 /node_modules/react 안에 default 가 붙어 수출하는 놈을 수입해서
// 현재 파일 안에서 React 란 이름으로 사용한다.
// 프로젝트명 /node_modules/react 안에 default 가 안붙어 수출하는 놈 useState 함수를 수입해서
// 현재 파일 안에서 useState 란 이름으로 사용할 것이다.
// ----------------------------------------------------------------
// <참고> 아래 수입 코드는 클래스 컴포넌트가 선언되는 js 파일안에서는 필수로 수입되는 것들이다.
import React, { Component } from "react";

// ----------------------------------------------------------------
// 리액트의 단위 프로그램중 하나인 [함수 컴포넌트] 선언하기
// ----------------------------------------------------------------
class Search3 extends Component {

    keywordRef = React.createRef();
  
    developerList = [
        {dev_no:1,dev_name:'사오정', addr:'서울시', phone:'010-1234-1234'}
        ,{dev_no:2,dev_name:'저팔계', addr:'경기도', phone:'010-2345-2345'}
        ,{dev_no:3,dev_name:'손오공', addr:'경상도', phone:'010-3456-3456'}
        ,{dev_no:4,dev_name:'삼장법사', addr:'전라도', phone:'010-4567-4567'}
        ,{dev_no:5,dev_name:'홍길동', addr:'강원도', phone:'010-5678-5678'}
        ,{dev_no:6,dev_name:'임꺽정', addr:'충청도', phone:'010-6789-6789'}
        ,{dev_no:7,dev_name:'고길동', addr:'서울시', phone:'010-7890-7890'}
    ];
   
    state = {
        developers:developerList
        ,inputText:''
    }
 
    textChange = (e) => {
        this.setState({inputText:e.target.value});
    }

    search = () => {
        const developers = this.state.developers;
        const inputText = this.state.inputText;

        const tmp_inputText = inputText.trim();
      
        this.setState({inputText:tmp_inputText});
        const new_developerList = developerList.filter(
            developer =>
                developer.dev_name.indexOf(tmp_inputText)>=0
                ||developer.addr.indexOf(tmp_inputText)>=0
                ||developer.phone.indexOf(tmp_inputText)>=0
        );
     
        this.setState({Developers:new_developerList});
        this.keywordRef.current.focus();
    };
    
    searchAll = () => {
     
        this.setState({InputText:""});
     
        this.setState({Developers:developerList});

        this.keywordRef.current.focus();
    
    }

    


    render () {
        const searchResultTag = this.state.developers.map(
            developer =>
                <tr>
                    <td>{developer.dev_no}</td>
                    <td>{developer.dev_name}</td>
                    <td>{developer.addr}</td>
                    <td>{developer.phone}</td>
                </tr>
        );
        const inputText = this.state.inputText;

        return(
            <>
                <center>
                    <br/>
                    키워드 : <input type='text' value={inputText} onChange={this.textChange}/>&nbsp;
                    <button onClick={this.search}> 검색 </button> &nbsp;&nbsp;&nbsp;
                    <button onClick={this.searchAll}> 모두검색 </button> 
                    <br/>
                    <br/>
                    <table style={{borderCollapse:"collapse"}} border="1" cellPadding="2">
                    검색개수 : {developers.length}
                        <tr>
                            <th>번호</th>
                            <th>직원명</th>
                            <th>거주지</th>
                            <th>전화번호</th>
                        </tr>
                        {searchResultTag}
                    </table>
                    {developers.length==0?'검색결과없음':null}
                </center>
            </>
        )
    }
}

export default Search3;
*/