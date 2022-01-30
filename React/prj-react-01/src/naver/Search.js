// ----------------------------------------------------------------
// 프로젝트명 /node_modules/react 안에 default 가 붙어 수출하는 놈을 수입해서
// 현재 파일 안에서 React 란 이름으로 사용한다.
// 프로젝트명 /node_modules/react 안에 default 가 안붙어 수출하는 놈 useState 함수를 수입해서
// 현재 파일 안에서 useState 란 이름으로 사용할 것이다.
// ----------------------------------------------------------------
// <참고> 아래 수입 코드는 클래스 컴포넌트가 선언되는 js 파일안에서는 필수로 수입되는 것들이다.
import React, {useRef, useState } from "react";

// ----------------------------------------------------------------
// 리액트의 단위 프로그램중 하나인 [함수 컴포넌트] 선언하기
// ----------------------------------------------------------------
const Search = () => {

    const devRef = useRef(null);
    // ----------------------------------------------------------------
    // 지역변수 names, setNames 선언하고
    // 지역변수 names 에는 [~] 즉 Array 객체 저장하고
    // 지역변수 setNames 에는 지역변수 names 안을 갱신하는 익명함수 저장하기
    // 이후부터 setNames(~)가 호출되면 함수컴포넌트 안의 코딩이 재 실행된다.
    // 재 실행 시 useState 함수 호출이 있는 코딩줄은 재 실행에서 제외된다.
    // 이제부터 names 는 마치 클래스 컴포넌트의 state 속성변수와 동일한 성격을 가지게 된다.
    // ----------------------------------------------------------------
    const [developers, setDevelopers] = useState (
            [
            {dev_no:1,dev_name:'사오정', addr:'서울시', phone:'010-1234-1234'}
            ,{dev_no:2,dev_name:'저팔계', addr:'경기도', phone:'010-2345-2345'}
            ,{dev_no:3,dev_name:'손오공', addr:'경상도', phone:'010-3456-3456'}
            ,{dev_no:4,dev_name:'삼장법사', addr:'전라도', phone:'010-4567-4567'}
            ,{dev_no:5,dev_name:'홍길동', addr:'강원도', phone:'010-5678-5678'}
            ,{dev_no:6,dev_name:'임꺽정', addr:'충청도', phone:'010-6789-6789'}
            ,{dev_no:7,dev_name:'고길동', addr:'서울시', phone:'010-7890-7890'}
            ]
    );
    const [keyword, setKeyword] = useState('');
    const [searchDevelopers, setSearchDevelopers] = useState(developers);

    const developersList = searchDevelopers.map(
        developer =>
        <tr><td>{developer.dev_no}</td><td>{developer.dev_name}</td><td>{developer.addr}</td><td>{developer.phone}</td></tr>
    );

    const searchKeyword = (e) => {
        
        let val = e.target.value;
        val = val.trim();
        setKeyword(val);
    }

    const search = () => {
        // ----------------------------------------------------------------
        // 만약 입력한 데이터가 비어있으면 경고하고 함수 중단.
        // ----------------------------------------------------------------
        if(keyword==null || keyword==undefined || keyword.split(" ").join("")=="") {
            alert ("데이터가 비어있어 검색 불가능");
            setKeyword("");
            // ----------------------------------------------------------------
            // ref={nameRef} 가진 태그에 포커스 들여놓기.
            // ----------------------------------------------------------------
            devRef.current.focus();
            return;
        }
        let Keyword = keyword.trim();
        const searchDev = developers.filter(
            dev => dev.dev_name.indexOf(Keyword) !== -1||dev.addr.indexOf(Keyword) !== -1||dev.phone.indexOf(Keyword) !== -1
          )
          setSearchDevelopers(searchDev);


    }
    const searchAll = () => {
        setKeyword("");
        setSearchDevelopers(developers);
    }
    
    // ----------------------------------------------------------------
    // JSX 문법을 가진 return 구문 선언
    // 리턴되는 JSX 문법이 결국 웹화면에 출력된다.
    // ----------------------------------------------------------------    
    return(

        <>
            <center>
                <div style={{height:'20px'}}/>
                키워드 : <input type='text' value={keyword} onChange={searchKeyword} ref={devRef} />&nbsp;
                <button onClick={search}> 검색 </button> &nbsp;&nbsp;&nbsp;
                <button onClick={searchAll}> 모두검색 </button> 
                <div style={{height:'20px'}}/>
                <table style={{borderCollapse:"collapse"}} border="1" cellPadding="2">
                
                    <tr>
                        <th>번호</th>
                        <th>직원명</th>
                        <th>거주지</th>
                        <th>전화번호</th>
                    </tr>
                    {developersList}
                </table>
            </center>
        </>
    )

}

export default Search;
