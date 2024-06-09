# NodeJS Ts 환경 만들기
> NodeJs를 Typescript로 만들자.

## 1. 프로젝트 생성
```
npm init
```

## 2. express 환경을 구성하기 위해 필요한 모듈 설치
```
 npm i -D express ts-node typescript nodemon @types/node @types/express ejs
```

## 3. tsconfig.json 설정

TypeScript 컴파일은 tsc라는 명령어를 이용하여 컴파일합니다.

```
tsc --init
```
tsconfig.json이라는 파일이 생성됩니다.

컴파일러 옵션을 설정하고 프로젝트를 컴파일하는데 필요한 루트파일을 지정합니다.


## tsconfig.json 파일이 생성되면 나오는 내용
```typescript

{
  "compilerOptions": {
    /* Basic Options */
    // "incremental": true,                
    "target": "es5",                         
    "module": "commonjs",                    
    // "lib": [],                            
    // "allowJs": true,                   
    // "jsx": "preserve",                 
    // "declaration": true,             
    // "declarationMap": true,             
    // "sourceMap": true,             
    // "outFile": "./",                       
    // "outDir": "./",                       
    // "rootDir": "./",                      
    // "composite": true,                   
    // "tsBuildInfoFile": "./",              
    // "removeComments": true,             
    // "noEmit": true,                      
    // "importHelpers": true,             
    // "downlevelIteration": true,           
    // "isolatedModules": true,             

    /* Strict Type-Checking Options */
    "strict": true,                   
    // "noImplicitAny": true,                
    // "strictNullChecks": true,              
    // "strictFunctionTypes": true,           
    // "strictBindCallApply": true,           
    // "strictPropertyInitialization": true,  
    // "noImplicitThis": true,               
    // "alwaysStrict": true,                 

    /* Additional Checks */
    // "noUnusedLocals": true,              
    // "noUnusedParameters": true,        
    // "noImplicitReturns": true,             
    // "noFallthroughCasesInSwitch": true,    

    /* Module Resolution Options */
    // "moduleResolution": "node",            
    // "baseUrl": "./",                     
    // "paths": {},                           
    // "rootDirs": [],                        
    // "typeRoots": [],                      
    // "types": [],                          
    // "allowSyntheticDefaultImports": true,  
    "esModuleInterop": true,                 
    // "preserveSymlinks": true,             
    // "allowUmdGlobalAccess": true,         

    /* Source Map Options */
    // "sourceRoot": "",    
    // "mapRoot": "",                      
    // "inlineSourceMap": true,              
    // "inlineSources": true,                 

    /* Experimental Options */
    // "experimentalDecorators": true,        
    // "emitDecoratorMetadata": true,        

    /* Advanced Options */
    "forceConsistentCasingInFileNames": true  
  }
}                  
```

## express 서버 설정 (tsconfig.json)

```typescript

{
  "compilerOptions": {
    /* Basic Options */
    // "incremental": true,                
    "target": "es6",                         
    "module": "commonjs",                    
    // "lib": [],                            
    // "allowJs": true,                   
    // "jsx": "preserve",                 
    // "declaration": true,             
    // "declarationMap": true,             
    // "sourceMap": true,             
    // "outFile": "./",                       
    "outDir": "./",                       
    "rootDir": "./",                      
    // "composite": true,                   
    // "tsBuildInfoFile": "./",              
    // "removeComments": true,             
    // "noEmit": true,                      
    // "importHelpers": true,             
    // "downlevelIteration": true,           
    // "isolatedModules": true,             

    /* Strict Type-Checking Options */
    "strict": true,                   
    // "noImplicitAny": true,                
    // "strictNullChecks": true,              
    // "strictFunctionTypes": true,           
    // "strictBindCallApply": true,           
    // "strictPropertyInitialization": true,  
    // "noImplicitThis": true,               
    // "alwaysStrict": true,                 

    /* Additional Checks */
    // "noUnusedLocals": true,              
    // "noUnusedParameters": true,        
    // "noImplicitReturns": true,             
    // "noFallthroughCasesInSwitch": true,    

    /* Module Resolution Options */
    "moduleResolution": "node",            
    // "baseUrl": "./",                     
    // "paths": {},                           
    // "rootDirs": [],                        
    // "typeRoots": [],                      
    // "types": [],                          
    // "allowSyntheticDefaultImports": true,  
    "esModuleInterop": true,                 
    // "preserveSymlinks": true,             
    // "allowUmdGlobalAccess": true,         

    /* Source Map Options */
    // "sourceRoot": "",    
    // "mapRoot": "",                      
    // "inlineSourceMap": true,              
    // "inlineSources": true,                 

    /* Experimental Options */
    // "experimentalDecorators": true,        
    // "emitDecoratorMetadata": true,        

    /* Advanced Options */
    "forceConsistentCasingInFileNames": true  
  }
}                  
```

-  target: 컴파일 할 Ecmascript 대상을 지정

-  outDir: 컴파일 경로 지정

-  rootDir: 컴파일할 대상의 root 디렉토리 지정 (이에 맞춰서 컴파일 시 나오는 outDir의 구조가 똑같이 만들어 집니다.)

-  strict: 타입스크립트의 strict모드 활성화 여부

## package.json 설정

```js

{
  "name": "typescript-example",
  "version": "1.0.0",
  "description": "",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "@types/express": "^4.17.2",
    "@types/node": "^13.1.0",
    "express": "^4.17.1",
    "nodemon": "^2.0.2",
    "ts-node": "^8.5.4"
  },
  "dependencies": {
    "ejs": "^3.0.1",
    "typescript": "^3.7.4"
  }
}
```

"script" 내용을 수정해줍니다.
```
"scripts": {
  "start": "node dist/app.js",
  "dev": "nodemon app.ts",
  "build": "tsc -p ."
}
```

-  start: 컴파일 후 나온 app.js 파일을 돌릴 명령어입니다.

-  dev: nodemon으로 타입스크립트 파일을 돌려볼 명령어입니다. 컴파일시키지 않고 돌려만 볼 수도 있습니다.

-  build: 실제로 컴파일해서 자바스크립트 파일을 생성해줍니다.


## 폴더 구조 잡기

app.ts 파일 생성
routes 폴더
views 폴더 생성
routes/index.ts 생성
views/index.ejs 생성


## app.ts 에 express 코드 작성

./app.ts
```typescript

import express, {Request, Response, NextFunction} from 'express';
import path from 'path';

const app = express();

import indexRouter from "./routes/index";

app.set('views',path.join(__dirname,'views'));
app.set('view engine','ejs');  // 템플릿 엔진 설정

app.use('/',indexRouter);


app.listen(8001,()=>{  // 포트번호 설정
  console.log('8001번 포트에서 서버 대기중입니다!');
});
```

./routes/index.ts
```typescript

import * as express from 'express';

const router = express.Router();

router.get('/',async (req:express.Request,res:express.Response, next:express.NextFunction)=>{
    res.render('index');
});

export default router;
```

./vies/index.ejs
```ejs

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    hello
</body>
</html>
```

## typescript 로 작성한 express 실행

- npm run dev


위 명령어를 터미널에 치게 되면 다음과 같이 서버가 실행된다.
포트번호는 app.ts 에서 설정했음

이후 이 타입스크립트 파일을 컴파일해서 js로 변환할 수 있다.


- npm run build
 
 
 이후 컴파일된 파일은 js파일로 가동할 수 있다.



- npm start



