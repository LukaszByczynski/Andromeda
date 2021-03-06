module Andromeda.Language.LogicControl.AST where

type IdName = String
type ConstrName = String

data Constant
  = StringConstant String
  | IntegerConstant Int
  deriving (Show)

data ArgDef
  = NoneArgs
  | Args [Expr]
  deriving (Show)

data ParamDef
  = NoneParams
  | Params [IdName]
  deriving (Show)

data Constructor
  = Constructor ConstrName ArgDef
  deriving (Show)

data Identifier
  = Identifier IdName ArgDef
  deriving (Show)

data Expr
  = ConstantExpr Constant
  | ConstructorExpr Constructor
  | IdentifierExpr Identifier
  deriving (Show)

data Statement
  = ConstantStmt IdName Expr -- TODO: make this constexpr (i.e. no Expr, only Constant)
  | ValStmt IdName Expr
  | CallStmt Expr
  deriving (Show)

data IndentedStatement
  = IndentedStmt Int Statement
  deriving (Show)

data LinedIndentedStatement
  = LinedIndentedStmt IndentedStatement
  | LinedEmptyStmt
  deriving (Show)

data ProcedureDecl
  = ProcDecl IdName ParamDef
  deriving (Show)

data ProcedureBody
  = ProcBody [LinedIndentedStatement]
  deriving (Show)

data ProcedureDef
  = ProcDef ProcedureDecl ProcedureBody
  deriving (Show)

data ScriptType
  = ControllerScriptDef
  | InfrastructureScriptDef
  deriving (Show, Ord, Eq)

data ProgramEntry
  = ProcedureEntry ProcedureDef
  | ScriptEntry ScriptType ProcedureDef
  | LinedEntry Statement
  | LinedEmptyEntry
  deriving (Show)

data ProgramAst
  = ProgramAst [ProgramEntry]
  deriving (Show)
