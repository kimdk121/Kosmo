



export function isEmpty(str) {
    let result = false;
    let dataType = typeof(str);
    /*
    if(dataType != "string") {
        alert("isEmpty 함수 호출 시 매개변수에는 문자가 들어와야 합니다.")
    }
    */
    if(dataType=="string" && (str=="" || str.split(" ").joinm("")=="") ) {
        result = true;
    }
    return result;
}
export function isNotEmpty(str) {
    return !isEmpty(str);
}

export function is_from_arr(targetArr,keywordStr) {
    let result = false;
    if(targetArr!=null) {
        for(let i=0; i<targetArr.length; i++) {
            if(targetArr[i]==keywordStr) {
                result = true;
                break;
            }
        }
    }
    return result;
}

export function del_dupl(targetArr) {
    if(targetArr!=null) {
        for(let i=0; i<targetArr.length-1; i++) {
            for(let j=i+1; j<targetArr.length; j++) {
                if(targetArr[i]==targetArr[j]) {
                    targetArr.splice(j,1)
                }
            }
        }
    }
}