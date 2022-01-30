import React, { useState } from "react";
// ----------------------------------------------------------------
// 리액트의 단위 프로그램중 하나인 [함수 컴포넌트] 선언하기
// ----------------------------------------------------------------
function Test03() {
    // 지역변수 names 선언하고 사용자정의 객체 4가 저장된 Array 객체를 저장하기
    const names =
        [
        {id:1,test:'사오정'}
        ,{id:2,test:'저팔계'}
        ,{id:3,test:'손오공'}
        ,{id:4,test:'삼장법사'}
    ];
    // ----------------------------------------------------------------
    // 지역변수 namesTag 선언하고
    // Array 객체의 map 메소드를 호출하여
    // names에 저장된 사용자정의 객체를 1개씩 꺼내서
    // 아래의 화살표 함수를 호출하여 리턴되는 html 코딩을
    // name => <tr><td>{name.id}</td><td>{name.text}</td></tr>
    // ----------------------------------------------------------------
    const namesTag = names.map(
        name =>
                <tr>
                    <td>{name.id}</td>
                    <td>{name.text}</td>
                </tr>
    )
    

    return (
        <>
            <center>
                <table border="1" cellPadding="2">
                    <caption>{names.length}명</caption>
                    <tr>
                        <th>학생번호</th>
                        <th>학생명</th>
                    </tr>
                    {namesTag}
                </table>
            </center>
        </>
    )

}

export default Test03;