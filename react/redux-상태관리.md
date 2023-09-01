# redux 를 사용하여 상태관리 컴포넌트를 최상위에 지정하는 방법

### redux폴더/rootReducer.js

```js
import { persistReducer } from 'redux-persist'; // 추가
import storage from 'redux-persist/lib/storage';

// state , useState
// selector , dispatch

const persistConfig = {
    key: 'root',
    storage,
};

const initialState = {
    token: false,
};

const rootReducer = (state = initialState, action) => {
    let temp = { ...state };
    switch (action.type) {
        case 'SET_TOKEN':
            temp.token = action.payload;
            return temp;
        case 'CLEAR_TOKEN':
            temp.token = false;
            return temp;
        default:
            return state;
    }
};

const persistedReducer = persistReducer(persistConfig, rootReducer);

export default persistedReducer;



```

* dispatch 를 사용하여서 action 의 상태를 state에 담아서 전달하는 방식이다.

### index.js

```js
import reportWebVitals from './reportWebVitals';
import { BrowserRouter } from 'react-router-dom';
import { Provider } from 'react-redux';
import { PersistGate } from 'redux-persist/integration/react';
import { composeWithDevTools } from 'redux-devtools-extension';
import rootReducer from './redux/rootReducer';
import { persistStore } from 'redux-persist'; // 추가
import { createStore } from 'redux';

const store = createStore(rootReducer, composeWithDevTools());
const persistor = persistStore(store);

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <Provider store={store}>
        <PersistGate persistor={persistor}>
            <App />
        </PersistGate>
    </Provider>
);

```

* rootReducer에서 만든 상태 저장소를 store에 선언하여서 root 맨 바깥에 Provier 태그에 담아준다.

* PersistGate 에서 persistor를 통해서 데이터를 redux에 불러오기 위한 작동을 담당한다.


### App.js에 React Router 설정

```js
 <BrowserRouter>
                <Routes>
                    <Route path="/" Component={Signin}></Route>
                    <Route path="/Main" Component={Main2}></Route>
                    <Route path="/signup" Component={Signup}></Route>
                </Routes>
            </BrowserRouter>

```

* 기본적인 Router를 사용하여 path 지정을 Component와 연결지어 주는 역할이다.


### Component에서의 useDispatch, useSelector , useState, useEffect 를 사용한 로그인 동작 예제

```js

function Signin() {
    const images = ['image1', 'image2', 'image3', 'image4'];
    const [currentImageIndex, setCurrentImageIndex] = useState(0);

    const Data = {
        id: 'amazon7737',
        password: '1234',
    };
    // 로그인 데이터 정의
    const [id, setId] = useState('');
    const [password, setPassword] = useState('');

    // 상태유지
    const Myfunction = () => {
        // setStatus(true);
        dispatch({
            type: 'SET_TOKEN',
            payload: true,
        }); // console.log('!!!:', status);
    };

    const dispatch = useDispatch();
    const token = useSelector((state) => state.token);

    // 로그인데이터 관리

    const inputIdHandler = (e) => {
        setId(e.target.value);
    };

    const inputPassHandler = (e) => {
        setPassword(e.target.value);
    };

    // 로그인 처리

    const signIn = () => {
        const userData = {
            userId: id,
            userPassword: password,
        };

        try {
            console.log('userData:', userData);
            if (userData.userId === Data.id && userData.userPassword === Data.password) {
                Myfunction();
                alert('로그인 확인되었습니다.');
                window.location.replace('/main');
            } else {
                alert('아이디 또는 비밀번호를 확인해주세요.');
            }
        } catch (error) {
            console.log(error);
        }
    };

    // 로그아웃 처리

    const signOut = () => {
        dispatch({
            type: 'CLEAR_TOKEN',
        });
        if (token === true) {
            alert('로그아웃 되었습니다.');
        }
    };

    useEffect(() => {
        console.log('!!!:', token);
    }, [token]);

    return (
        <div>
                    <div>
                        <input
                            type="text"
                            onChange={inputIdHandler}
                            placeholder="아이디를 입력하세요"
                        />
                    </div>

                    <div>
                        <input
                            type="text"
                            onChange={inputPassHandler}
                            placeholder="비밀번호를 입력하세요"
                        />
                    </div>

                    <div>
                        <button onClick={signIn}>로그인하기</button>
                    </div>

                </div>
            </div>
            <Footer></Footer>
        </div>
    );
}

export default Signin;


```

* useSelector 를 통해서 state라는 상태객체가 token 데이터를 가져오고 

* dispatch 선언을 해준다.

* dispatch에 담아주는 상태 유지 함수를 만들어주고

* 아이디와 비밀번호 데이터를 담기위한 useState 를 만들어준다.

* 그리고 그 데이터를 관리하는 함수들을 setId , setPassword를 활용하여서 만들어준다.

* 만들어준 기능들을 로그인 처리 함수를 만들어서 동작을 구현한다.
