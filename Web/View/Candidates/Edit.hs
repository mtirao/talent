module Web.View.Candidates.Edit where
import Web.View.Prelude

data EditView = EditView { candidate :: Candidate, statuses :: [Status]}

instance CanSelect Status where
    -- Here we specify that the <option> value should contain a `Id User`
    type SelectValue Status = Text  
    -- Here we specify how to transform the model into <option>-value
    selectValue = get #name
    -- And here we specify the <option>-text
    selectLabel = get #name

instance View EditView where
    html EditView { .. } = [hsx|
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/">Talent</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="breadcrumb-item">
                        <a class="nav-link" href={CandidatesAction}>Candidates</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=new">New</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=interviewed">Interviewed</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=contacted">Contacted</a>
                    </li>
                </ul>
            </div>
        </nav>
        <h1>Edit Candidate</h1>
        {renderForm candidate statuses}
    |]

renderForm :: Candidate -> [Status] -> Html
renderForm candidate statuses = formFor candidate [hsx|
    {(textField #name)}
    {(textField #email)}
    {(textField #skills)}
    {(textField #profile)}
    {(textField #education)}
    {(textField #city)}
    {(textField #country)}
    {(textField #linkedin)}
    {(textField #github)}
    {(textField #englishLevel)}
    {(selectField #status statuses)}
    {(textareaField #comments)}
    {submitButton}
|]
