import React, {useMemo, useRef, useState ,useCallback} from "react";

const getAverage = (numbers) {
    if(numbers==null || numbers.length===0) {return 0;}
    // ----------------------------------------------------------------
    // 지역변수 sum 선언하고 매개변수로 들어온 Array 객체 안의 데이터를 모두 더해서 저장하기
    // 이때 Array 객체의 reduce 메소드를 이용한다.
    // ----------------------------------------------------------------
    const sum = numbers.reduce ( (a,b) => a + b) ;
    // ----------------------------------------------------------------
    // Array 객체 안의 데이터를 모두 더해서 개수로 나누기
    // 즉 평균 구해 리턴하기
    // ----------------------------------------------------------------
    return sum/numbers.length;
}

const Avg = () => {
    const [list, setList] = useState([]);
    const [number, setNumber] = useState('');
    
    const numberChange = e => {
        setNumber(e.target.value);
    }
    const insert = () => {
        const nextList = list.concat (parseInt(number,10));
        setList(nextList);
        setNumber('');
    }
    const avg = useMemo (getAverage(list),[list]);
    return (
        <>
            <center>
                <input type="text" onChange={numberChange} />&nbsp;
                <button onClick={insert}>등록</button>

                <ul>
                    {
                        list.map (
                            value=><li>{value}</li>
                        )
                    }
                </ul>
                <div>
                    <b>평균값:</b> {avg}
                </div>
            </center>
        </>
    )
}

export default Avg;