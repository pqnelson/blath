"""
 Original work: Copyright 2009 Luca Trevisan
 (additional contributors: Radu Grigore)

 Modified work: Copyright 2018 Sean Eberhard
 (additional contributors: see https://github.com/seaneberhard/latex2wp/graphs/contributors)

 This file is part of LaTeX2WP, a program that converts
 a LaTeX document into a format that is ready to be
 copied and pasted into WordPress.

 You are free to redistribute and/or modify LaTeX2WP under the
 terms of the GNU General Public License (GPL), version 3
 or (at your option) any later version.

 I hope you will find LaTeX2WP useful, but be advised that
 it comes WITHOUT ANY WARRANTY; without even the implied warranty
 of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GPL for more details.

 You should have received a copy of the GNU General Public
 License along with LaTeX2WP.  If you can't find it,
 see <http://www.gnu.org/licenses/>.
"""

# color of LaTeX formulas
textcolor = '000000'

# colors that can be used in the text
colors = dict(red='ff0000', green='00ff00', blue='0000ff')

# counters for theorem-like environments
# assign any counter to any environment. Make sure that
# maxcounter is an upper bound to the any counter being used
theorems = dict(theorem=0, lemma=0, proposition=0, definition=0, corollary=2, conjecture=0, remark=2, example=0,
                claim=0, exercise=1, problem=0, question=0)

# the way \begin{theorem}, \begin{lemma} etc are translated in HTML
# the string _ThmType_ stands for the type of theorem
# the string _ThmNumb_ is the theorem number
# beginthm = '\n<section class="_ThmType_"><b>_ThmType_ _ThmNumb_.</b> '
beginthm = '\n<section class="proposition _ThmType_"><p><span class="number">_ThmNumb_.</span> <span class="label">_ThmType_.</span> '

begin_xca = '\n<section class="proposition _ThmType_"><p><span class="label">_ThmType_</span> <span class="number">_ThmNumb_.</span> '

# translation of \begin{theorem}[...]. The string
# _ThmName_ stands for the content betwee the
# square brackets
#beginnamedthm = '\n<section class="_ThmType_"><b>_ThmType_ _ThmNumb_ (_ThmName_).</b> '
beginnamedthm = '\n<section class="proposition _ThmType_"><p><span class="number">_ThmNumb_.</span> <span class="label">_ThmType_ (_ThmName_).</span> '

begin_named_xca = '\n<section class="proposition _ThmType_"><p><span class="label">_ThmType_</span> <span class="number">_ThmNumb_</span> (_ThmName_)<span class="label">.</span> '

# translation of \end{theorem}, \end{lemma}, etc.
endthm = '\n</p>\n</section>\n<p>\n'

beginproof = '\n<section class="proof"><p><em>Proof:</em> '

thm_style_start = dict(theorem='<em>', lemma='<em>', proposition='<em>', corollary='<em>', conjecture='<em>')
thm_style_end = dict(theorem='</em>', lemma='</em>', proposition='</em>', corollary='</em>', conjecture='</em>')

solid_halmos_tombstone = '&#8718;' # according to Wikipedia, at least...
# alternatives: '&#x025AE;' or '&marker;'
hollow_halmos_tombstone = '&#x25AF;' # just a guess

def endproof(html):
    # if html:
    #     return r'<img src="http://l.wordpress.com/latex.php?latex=\Box&fg=000000">\n</p>\n</section>'
    return ' '+solid_halmos_tombstone+'\n</p>\n</section>\n'

#section = '\n<p>\n<b>_SecNumb_. _SecName_ </b>\n<p>\n'
#sectionstar = '\n<p>\n<b> _SecName_ </b>\n<p>\n'
#subsection = '\n<p>\n<b>  _SecNumb_._SubSecNumb_. _SecName_ </b>\n<p>\n'
#subsectionstar = '\n<p>\n<b> _SecName_ </b>\n<p>\n'
section = '\n<h1>_SecNumb_. _SecName_</h1>\n'
sectionstar = '\n<h1>_SecName_</h1>\n'
subsection = '\n<h2>_SecNumb_._SubSecNumb_. _SecName_</h2>\n'
subsectionstar = '\n<h2>_SecName_</h2>\n'

# Font styles. Feel free to add others. The key *must* contain
# an open curly bracket. The value is the namem of a HTML tag.
fontstyle = {
    r'{\em ': 'em',
    r'{\bf ': 'b',
    r'{\it ': 'i',
    r'{\sl ': 'i',
    r'\textit{': 'i',
    r'\textsl{': 'i',
    r'\emph{': 'em',
    r'\textbf{': 'b',
	r'\define{': 'dfn'
}
