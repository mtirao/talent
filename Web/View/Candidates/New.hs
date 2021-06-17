module Web.View.Candidates.New where
import Web.View.Prelude

data NewView = NewView { candidate :: Candidate }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/">Talent</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/Candidates">Candidates</a>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=tech interview">Tech interview</a>
                    </li>
                </ul>
            </div>
        </nav>
        <h1>New Candidate</h1>
        {renderForm candidate}
    |]

renderForm :: Candidate -> Html
renderForm candidate = formFor candidate [hsx|
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
    {(textField #status)}
    {(textareaField #comments)}
    {submitButton}
|]
