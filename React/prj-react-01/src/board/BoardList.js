import React, {useState, useRef, useEffect} from 'react';
import axios from "axios";

function BoardList(props) {

    // ----------------------------------------------------------------
    // 검색 조건이 저장되는 searchCdt 지역 변수 선언
    // ----------------------------------------------------------------
    const [searchCdt, setSearchCdt] = useState( {keyword1:''} );
    // ----------------------------------------------------------------
    // 검색 결과물이 저장되는 searchResult 지역변수 선언하기
    // 검색 결과물은 비동기 방식으로 타 서버에 접근해서 응답 받아온 결과물이다
    // 응답 결과물이란 결국 JSON 객체이다.
    // 타 서버가 HashMap 객체로 응답하면 리액트에서는 JSON 으로 받는다.
    // ----------------------------------------------------------------
    // 검색 결과물은 다음과 같다.
    //      검색 select 결과물
    //      선택 페이지 번호
    //      한 화면에 보여줄 행의 개수
    //      한 화면에 보여줄 페이지 번호의 개수
    //      시작 페이지 번호
    //      끝 페이지 번호
    //      검색 총개수
    //      마지막 페이지 번호(=총 페이지 개수)
    // ----------------------------------------------------------------
    const [searchResult, setSearchResult] = useState( {} );

    // ----------------------------------------------------------------
    // 함수 컴포넌트 안의 코딩이 모두 실행된 이후
    // search 변수안의 화살표 함수 안의 코딩하도록 설정하기 
    // ----------------------------------------------------------------
    useEffect(
        ()=>{
            search();
        }
        ,[]
    );

    // ----------------------------------------------------------------
    // 지역변수 search 선언하고 화살표 함수 저장하기
    // 검색 버튼 눌렀을 때 실행할 코딩 설정하기
    // ----------------------------------------------------------------
    const search = () => {
        // ----------------------------------------------------------------
        // 타 서버에 'http://localhost:8081/naver/boardList.do' 로 post 방식으로 접속하면서
        // searchCdt 변수 안의 데이터를 가지고 접속하기
        // 타 서버가 응답을 성공했을 경우
        // responseJson => {~} 화살표함수 호출하기
        // 이 때 매개변수 responseJson 으로는 JSON 객체가 들어온다.
        // JSON 객체안에 타 서버가 DB 연동해서 얻은 결과물이 들어있다.
        // 타 서버가 응답을 실패했을 경우
        // function (error) {~} 익명함수 호출하기
        // ----------------------------------------------------------------
        // 결과적으로 매개변수 responseJson 으로는
        //      검색 select 결과물 (n행 m열, 즉 1개의 Array 객체 안에 다량의 JSON이 들어있다.)
        //      선택 페이지 번호
        //      
        axios.post(
            'http://localhost:8081/naver/boardList.do'
            , searchCdt
        ).then(
            responseJson => {
                setSearchResult( {...searchResult, ...responseJson.data} )
                // alert(responseJson.data.boardListAllCnt)
            }
        ).catch(
            (error) => {
                alert("서버연동실패" + error.message);
            }
        )
    }


    return(
        <><center>
            <br></br>
            [키워드] : <input   
                            type="text"
                            name="keyword1"
                        />

            <br></br>
            <br></br>

            <button onClick={search}>검색</button>{' '}
            <button>모두검색</button>{' '}
            <button 
                onClick={()=>{props.history.push('/board/loginForm');}}
            >로그아웃
            </button><br></br>
            
            <br></br>

            {/* ****************************************** */}
            {searchResult.boardListAllCnt} 개
            {/* ****************************************** */}
            <table border="0" cellPadding="5" cellSpacing="0">
                <tr bgcolor="lightgray">
                    <th>번호</th>
                    <th>제목</th>
                    <th>조회수</th>
                    <th>등록일</th>
                </tr>
                {
                    searchResult.boardList==null
                    ?
                    null
                    :
                    searchResult.boardList.map(
                        (board,i)=>
                            <tr>
                                <td>
                                    {
                                        searchResult.boardListAllCnt
                                        -
                                        (searchResult.selectPageNo*20-20+1)+1-i
                                    }
                                </td>
                                <td>{board.subject}</td>
                                <td>{board.readcount}</td>
                                <td>{board.reg_date}</td>
                            </tr>
                    )

                }
            </table>
            {/* ****************************************** */}
            <br></br>

                {/* 페이지 처리 및 작업에 필요한 데이터 꺼내지는지 테스트 */}
                {searchResult.last_pageNo} <br/>
                {searchResult.min_pageNo} <br/>
                {searchResult.max_pageNo} <br/>
                {searchResult.selectPageNo} <br/>
                {searchResult.rowCntPerPage} <br/>
                {searchResult.pageNoCntPerPage} <br/>

        </center></>
    )
}
export default BoardList;


/*
    ----------------------------------------------------------------
    처음으로 함수 컴포넌트가 호출되어 함수 컴포넌트 안의 코딩이 모두 실행된 이후 실행할 코딩 설정
    그리고 useState 함수 호출로 선언된 모든 변수안의 데이터가 갱신될 때
    함수 컴포넌트 안의 코딩이 모두 실행된 이후 실행할 코딩 설정
    ----------------------------------------------------------------
        useEffect(
            () => {
                함수컴포넌트안의 내용이 모두 실행된 이후 실행할 코딩
            }
        );
    ----------------------------------------------------------------
    처음으로 함수 컴포넌트가 호출되어 함수 컴포넌트 안의 코딩이 모두 실행된 이후 실행할 코딩 설정.
    ----------------------------------------------------------------
        useEffect (
            () => {
                함수컴포넌트안의 내용이 모두 실행된 이후 실행할 코딩
            }
            ,[]
        );
    ----------------------------------------------------------------
    처음으로 함수 컴포넌트가 호출되어 함수 컴포넌트 안의 코딩이 모두 실행된 이후 실행할 코딩 설정.
    그리고 useState 함수호출로 선언된 지역변수명 변수안의 데이터가 갱신될 때
    함수 컴포넌트 안의 코딩이 모두 실행된 이후 실행할 코딩설정.
    ----------------------------------------------------------------
        useEffect (
            () => {
                함수컴포넌트안의 내용이 모두 실행된 이후 실행할 코딩
            }
            ,[지역변수명]
        );
*/

